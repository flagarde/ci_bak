#!/bin/sh

# First download ca-certificates
apt-get --allow-unauthenticated update
apt-get install -y --no-install-recommends --allow-unauthenticated gpg

# Add keys
cat "-----BEGIN PGP PUBLIC KEY BLOCK-----\n
Comment: Hostname: \n
Version: Hockeypuck ~unreleased\n
\n
xo0EUOrZnQEEALHmfDdzQ3LbKBIlYTjYxd6Yld6VWUDIWok4Gn3e8PAUZAbOsaNW\n
SIZL6Os2NQLtfQD0umkaJyyRIeOOH6nA/YvjJMGc0tJ9PFGa9mqON1ZmuWl0FUtQ\n
7W58xZKkfhQGXGpCBmzWn1ByBtN+Mio9kGdEcDAT3CGpNyQxc1+9BCM/ABEBAAHN\n
HUxhdW5jaHBhZCBQUEEgZm9yIGhBVHJheWZsb29kwrgEEwECACIFAlDq2Z0CGwMG\n
CwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEJ2zwM8jlXoo6gYEAJfCnBbuiP0p\n
qLotbv+ge6wIzTER+GxeHeRbWH5nCRRV+HXty6U3XoqOCUubfYA9+Ahf7Af5bqHM\n
C88XL18LNiTCGkLFhTyNpvPNTAgoH32b/cWn73kmHAgHa729CyA6IF3oBmLzx+Si\n
BQTnsjUNGbsIUaCMvlyEiXYAVphjZTZb\n
=YLao\n
-----END PGP PUBLIC KEY BLOCK-----\n"| gpg --dearmor | tee /etc/apt/trusted.gpg.d/gcc1.gpg  >/dev/null
# PPAs
## gcc-3.3 --> gcc-4.5
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 9DB3C0CF23957A28
echo "deb https://ppa.launchpadcontent.net/h-rayflood/gcc-lower/ubuntu trusty main" | tee /etc/apt/sources.list.d/gcc1.list
echo "deb-src https://ppa.launchpadcontent.net/h-rayflood/gcc-lower/ubuntu trusty main" | tee /etc/apt/sources.list.d/gcc1.list 
apt-get --allow-unauthenticated update

# Add archives
#echo "deb http://archive.ubuntu.com/ubuntu/ bionic main" | tee /etc/apt/sources.list.d/Ubuntu.list
#echo "deb http://archive.ubuntu.com/ubuntu/ bionic universe" | tee /etc/apt/sources.list.d/Ubuntu.list
#echo "deb http://archive.ubuntu.com/ubuntu/ xenial main" | tee /etc/apt/sources.list.d/Ubuntu.list
#echo "deb http://archive.ubuntu.com/ubuntu/ xenial universe" | tee /etc/apt/sources.list.d/Ubuntu.list

# Intel oneAPI
#echo "deb https://apt.repos.intel.com/oneapi all main" | tee /etc/apt/sources.list.d/oneAPI.list
# LLVM
#echo "deb http://apt.llvm.org/focal/ llvm-toolchain-focal main" | tee /etc/apt/sources.list.d/LLVM.list
#echo "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-13 main" | tee /etc/apt/sources.list.d/LLVM.list
#echo "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-14 main" | tee /etc/apt/sources.list.d/LLVM.list

#apt-get update
#apt-get dist-upgrade -y
#apt-get install --no-install-recommends -y software-properties-common wget ca-certificates apt-utils gpg-agent make binutils
#add-apt-repository -y ppa:ubuntu-toolchain-r/test
#apt-add-repository -y "deb http://archive.ubuntu.com/ubuntu/ bionic main"
#apt-add-repository -y "deb http://archive.ubuntu.com/ubuntu/ bionic universe"
#apt-add-repository -y "deb http://archive.ubuntu.com/ubuntu/ xenial main"
#apt-add-repository -y "deb http://archive.ubuntu.com/ubuntu/ xenial universe"
#apt-add-repository -y "deb http://archive.ubuntu.com/ubuntu/ xenial-updates main"
#apt-add-repository -y "deb http://archive.ubuntu.com/ubuntu/ xenial-updates universe"
## LLVM
#wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key| apt-key add -
#apt-add-repository -y "deb http://apt.llvm.org/focal/ llvm-toolchain-focal main"
#apt-add-repository -y "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-13 main"
#apt-add-repository -y "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-14 main"
## CMake
#wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null
#echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ focal main' | tee /etc/apt/sources.list.d/kitware.list >/dev/null
#echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ focal-rc main' | tee -a /etc/apt/sources.list.d/kitware.list >/dev/null
## Intel oneAPI
#wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
#sudo apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
#rm GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
#add-apt-repository "deb https://apt.repos.intel.com/oneapi all main"
#apt-get update
#rm /usr/share/keyrings/kitware-archive-keyring.gpg
#apt-get install kitware-archive-keyring
#apt-get remove --purge --yes software-properties-common
#deborphan | xargs sudo apt-get -y remove --purge
#apt-get autoremove --purge
#apt-get autoclean
#apt-get clean

