#!/bin/bash
set -e

TOOL=$1
VERSION=$2

echo "Install $TOOL at: $VERSION"

shopt -s nocasematch
if [ "$TOOL" = "gnu" ]; then
    sudo apt-get remove -y gcc-$VERSION g++-$VERSION
    sudo apt-get install -y gcc-$VERSION g++-$VERSION

    sudo rm -f /usr/bin/gcc
    sudo rm -f /usr/bin/g++

    sudo ln -s $(which gcc-$VERSION) /usr/bin/gcc
    sudo ln -s $(which g++-$VERSION) /usr/bin/g++

    gcc --version
else
    sudo apt-get install -y lsb-release wget software-properties-common gnupg
    wget https://apt.llvm.org/llvm.sh

    sudo bash llvm.sh $2

    sudo rm -f /usr/bin/clang
    sudo rm -f /usr/bin/clang++

    sudo ln -s $(which clang-$VERSION) /usr/bin/clang
    sudo ln -s $(which clang++-$VERSION) /usr/bin/clang++

    clang --version
fi
