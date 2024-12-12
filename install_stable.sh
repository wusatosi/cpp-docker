#!/bin/bash
set -e

TOOL=$1
VERSION=$2

if [ "$TOOL" = "GNU" ]; then
    echo "installing gcc-$VERSION"
    sudo apt-get remove -y gcc-$VERSION g++-$VERSION
    sudo apt-get install -y gcc-$VERSION g++-$VERSION

    gcc-$VERSION --version
else
    sudo apt-get install -y lsb-release wget software-properties-common gnupg
    wget https://apt.llvm.org/llvm.sh

    sudo bash llvm.sh $2
    clang-$2 --version
fi