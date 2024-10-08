FROM docker.io/jenkins/inbound-agent:latest-jdk11 AS base

LABEL org.opencontainers.image.source "https://github.com/planet-community/build-system-containers"

ENV CCACHE_SIZE=50G \
    CCACHE_DIR=/var/cache/ccache \
    USE_CCACHE=1 \
    CCACHE_COMPRESS=1 \
    PATH=$PATH:/usr/local/bin \
    DEBIAN_FRONTEND=noninteractive

USER root

RUN apt update \
    && apt upgrade -y \
    && apt dist-upgrade -y \
    && apt install -y \
    abootimg \
    build-essential \
    ccache \
    cpio \
    curl \
    flex \
    g++-multilib \
    gcc-multilib \
    git \
    gnupg2 \
    libtinfo5  \
    python-is-python3 \
    software-properties-common \
    sudo \
    unzip \
    wget \
    zip

USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
