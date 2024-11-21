FROM ubuntu:24.04

RUN apt-get update && apt-get install -y sudo adduser
RUN useradd -ms /bin/bash -p "" beman && usermod -aG sudo beman

USER beman

WORKDIR /home/beman

# Install Build System
COPY build_sys.sh .
RUN bash build_sys.sh

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

# Install stable versions:
# Grab the install scripts
# GCC via apt
COPY gcc_stable.sh .
COPY llvm_stable.sh .

# Clang via official script
RUN sudo apt-get install -y lsb-release wget software-properties-common gnupg
RUN wget https://apt.llvm.org/llvm.sh

# Install gcc stable
RUN bash gcc_stable.sh 12
RUN bash gcc_stable.sh 13
RUN bash gcc_stable.sh 14

# Install llvm stable
# LLVM 16 is not supported by install script, should we still try to install that?
RUN sudo bash llvm_stable.sh 17
RUN sudo bash llvm_stable.sh 18
RUN sudo bash llvm_stable.sh 19
RUN sudo bash llvm_stable.sh 20

# TODO： install trunk;

ENTRYPOINT [ "bash" ]
