FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-22.04

USER vscode

RUN sudo apt-get update

# Install pre-commit
RUN sudo apt-get install -y python3-pip && pip3 install pre-commit

COPY docker.sh docker.sh
RUN bash docker.sh
