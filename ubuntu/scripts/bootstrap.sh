#!/bin/sh

# PPAs
## Ubuntu
echo "deb http://archive.ubuntu.com/ubuntu/ bionic main" | tee /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ bionic universe" | tee -a /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ bionic-updates main" | tee /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ bionic-updates universe" | tee -a /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ xenial main" | tee -a /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ xenial universe" | tee -a /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ xenial-updates main" | tee -a /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ xenial-updates universe" | tee -a /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ focal main" | tee -a /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ focal universe" | tee -a /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ focal-updates main" | tee /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ focal-updates universe" | tee -a /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ hirsute main" | tee -a /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ hirsute universe" | tee -a /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ hirsute-updates main" | tee /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ hirsute-updates universe" | tee -a /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ impish main" | tee -a /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ impish universe" | tee -a /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ impish-updates main" | tee /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ impish-updates universe" | tee -a /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ kinetic main" | tee -a /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ kinetic universe" | tee -a /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ kinetic-updates main" | tee /etc/apt/sources.list.d/Ubuntu.list
echo "deb http://archive.ubuntu.com/ubuntu/ kinetic-updates universe" | tee -a /etc/apt/sources.list.d/Ubuntu.list

# Install required packages
apt-get update
apt-get dist-upgrade
apt-get install -y --no-install-recommends --allow-unauthenticated gpg ca-certificates wget apt-utils

# PPAs
echo "deb https://ppa.launchpadcontent.net/ubuntu-toolchain-r/ppa/ubuntu jammy main"  | tee /etc/apt/sources.list.d/Toolchain.list
echo "deb-src https://ppa.launchpadcontent.net/ubuntu-toolchain-r/ppa/ubuntu jammy main"  | tee /etc/apt/sources.list.d/Toolchain.list
## Intel oneAPI
echo "deb [signed-by=/usr/share/keyrings/oneAPI.gpg] https://apt.repos.intel.com/oneapi all main" | tee /etc/apt/sources.list.d/oneAPI.list
## LLVM
echo "deb [signed-by=/usr/share/keyrings/LLVM.gpg] http://apt.llvm.org/jammy/ llvm-toolchain-jammy main" | tee /etc/apt/sources.list.d/LLVM.list
echo "deb [signed-by=/usr/share/keyrings/LLVM.gpg] http://apt.llvm.org/jammy/ llvm-toolchain-jammy-13 main" | tee -a /etc/apt/sources.list.d/LLVM.list
echo "deb [signed-by=/usr/share/keyrings/LLVM.gpg] http://apt.llvm.org/jammy/ llvm-toolchain-jammy-14 main" | tee -a /etc/apt/sources.list.d/LLVM.list
## CMake
echo 'deb [signed-by=/usr/share/keyrings/CMake.gpg] https://apt.kitware.com/ubuntu/ jammy main' | tee /etc/apt/sources.list.d/kitware.list
echo 'deb [signed-by=/usr/share/keyrings/CMake.gpg] https://apt.kitware.com/ubuntu/ jammy-rc main' | tee -a /etc/apt/sources.list.d/kitware.list

# Keys
## Intel oneAPI
wget -O - https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB | gpg --dearmor - | tee /usr/share/keyrings/oneAPI.gpg
## LLVM
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | gpg --dearmor - | tee /usr/share/keyrings/LLVM.gpg
## CMake
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc | gpg --dearmor - | tee /usr/share/keyrings/CMake.gpg >/dev/null

apt-get update

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

