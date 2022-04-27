#!/bin/sh

# First download ca-certificates
apt-get --allow-unauthenticated update
apt-get install -y --no-install-recommends --allow-unauthenticated gpg ca-certificates

# PPAs
## gcc-3.3 --> gcc-4.5
#cat ./keys/h-rayflood.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/gcc1.gpg  >/dev/null
echo "deb [trusted=yes] https://ppa.launchpadcontent.net/h-rayflood/gcc-lower/ubuntu trusty main" | tee /etc/apt/sources.list.d/gcc1.list
echo "deb-src [trusted=yes] https://ppa.launchpadcontent.net/h-rayflood/gcc-lower/ubuntu trusty main" | tee /etc/apt/sources.list.d/gcc1.list 
apt-get update

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

