#!/bin/bash


# Need to install:
# gcc-15
# gcc-14
# gcc-13
# gcc-12
# clang-20
# clang-19
# clang-18
# clang-17
# clang-16

TAG="$1-$2"
TAG="${TAG,,}"

docker build --build-arg UBUNTU_VERSION=24.04 --build-arg COMPILER_CLASS=$1 --build-arg COMPILER_VERSION=$2 --tag $TAG .
