ARG UBUNTU_VERSION="24.04"

FROM ubuntu:${UBUNTU_VERSION}

RUN apt-get update && apt-get install -y sudo adduser
RUN useradd -ms /bin/bash -p "" beman && usermod -aG sudo beman

USER beman

WORKDIR /home/beman

# Install Build System
COPY build_sys.sh .
RUN bash build_sys.sh

# Install Compiler
COPY install_stable.sh .

ARG COMPILER_CLASS="GNU"
ARG COMPILER_VERSION="14"
RUN bash install_stable.sh ${COMPILER_CLASS} ${COMPILER_VERSION}

ENTRYPOINT [ "bash" ]
