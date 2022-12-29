FROM docker.io/jenkins/inbound-agent:latest-jdk11 AS base

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
    && apt install -y wget sudo gnupg2 software-properties-common \
    && apt install -y \
    abootimg \
    curl \
    cpio \
    python2 \
    python3 \
    python \
    libtinfo5  \
    build-essential \
    ccache \
    curl \
    flex \
    g++-multilib \
    gcc-multilib \
    git \
    zip \
    unzip \
    maven

USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
