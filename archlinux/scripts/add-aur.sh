#!/usr/bin/env bash
# this script takes two arguments and sets up unattended AUR access for user ${1} via a helper, ${2}
set -o pipefail
set -o errexit
set -o nounset
set -o verbose
set -o xtrace

AUR_USER="${1:-ab}"

# update mirrorlist
#curl --silent --location https://raw.githubusercontent.com/greyltc/docker-archlinux/master/get-new-mirrors.sh > /tmp/get-new-mirrors
#chmod +x /tmp/get-new-mirrors
#mv /tmp/get-new-mirrors /bin/.
#get-new-mirrors

# we're gonna need sudo to use the helper properly
pacman-key --init; 
pacman -Sy
pacman --sync --needed --noconfirm --noprogressbar sudo fakeroot binutils || echo "Nothing to do"

# create the user
AUR_USER_HOME="/var/${AUR_USER}"
useradd "${AUR_USER}" --system --shell /usr/bin/nologin --create-home --home-dir "${AUR_USER_HOME}"

# lock out the AUR_USER's password
passwd --lock "${AUR_USER}"

# create folder
mkdir -p /etc/sudoers.d

# give the aur user passwordless sudo powers for pacman
echo "${AUR_USER} ALL=(ALL) NOPASSWD: /usr/bin/pacman" > "/etc/sudoers.d/allow_${AUR_USER}_to_pacman"

# let root cd with sudo
echo "root ALL=(ALL) CWD=* ALL" > /etc/sudoers.d/permissive_root_Chdir_Spec

# build config setup
sudo -u ${AUR_USER} -D~ bash -c 'mkdir -p .config/pacman'

# use all possible cores for builds
sudo -u ${AUR_USER} -D~ bash -c 'echo MAKEFLAGS="-j\$(nproc)" > .config/pacman/makepkg.conf'

# don't compress the packages built here
#sudo -u ${AUR_USER} -D~ bash -c 'echo PKGEXT=".pkg.tar" >> .config/pacman/makepkg.conf'

# setup storage for AUR packages built
NEW_PKGDEST="/var/cache/makepkg/pkg"
NPDP=$(dirname "${NEW_PKGDEST}")
mkdir -p "${NPDP}"
install -o "${AUR_USER}" -d "${NEW_PKGDEST}"
sudo -u ${AUR_USER} -D~ bash -c "echo \"PKGDEST=${NEW_PKGDEST}\" >> .config/pacman/makepkg.conf"

# setup place for foreign packages
FOREIGN_PKG="/var/cache/foreign-pkg"
FPP=$(dirname "${FOREIGN_PKG}")
mkdir -p "${FPP}"
install -o "${AUR_USER}" -d "${FOREIGN_PKG}"

# get helper pkgbuild
sudo -u "${AUR_USER}" -D~ bash -c "curl --silent --location https://raw.githubusercontent.com/flagarde/ci_bak/main/archlinux/scripts/PKGBUILD >> ~/PKGBUILD"

# make helper
sudo -u "${AUR_USER}" -D~ bash -c "makepkg -s --noprogressbar --noconfirm --needed"

# install helper
pacman --upgrade --needed --noconfirm --noprogressbar "${NEW_PKGDEST}"/*.pkg.*

# cleanup
sudo rm -rf "${NEW_PKGDEST}"/*
rm -rf "${AUR_USER_HOME}/aura-bin"
rm -rf "${AUR_USER_HOME}/.cache/go-build"
rm -rf "${AUR_USER_HOME}/.cargo"

# chuck deps
pacman -Rns --noconfirm $(pacman -Qtdq) || echo "Nothing to remove"
