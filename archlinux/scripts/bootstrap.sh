#!/bin/sh
useradd --no-create-home --shell=/bin/false build && usermod -L build
echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
makepkg ./archlinux/aurora-bin
