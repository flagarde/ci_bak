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
apt-get install kitware-archive-keyring
apt-get autoremove --purge
apt-get autoclean
apt-get clean
