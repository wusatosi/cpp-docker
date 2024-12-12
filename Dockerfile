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
COPY install_stable.sh .

# Install gcc stable
RUN bash install_stable.sh GNU 12
RUN bash install_stable.sh GNU 13
RUN bash install_stable.sh GNU 14

# Install llvm stable
# LLVM 16 is not supported by install script, should we still try to install that?
RUN bash install_stable.sh LLVM 17
RUN bash install_stable.sh LLVM 18
RUN bash install_stable.sh LLVM 19
RUN bash install_stable.sh LLVM 20

# TODO： install trunk;

ENTRYPOINT [ "bash" ]
