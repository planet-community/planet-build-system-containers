FROM ghcr.io/shymega/planet-build-system-containers:latest-planet-android-rom-builder AS base

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt install -y \ 
        git \
        build-essential \
        clang \
        zlib1g-dev \
    && git clone https://github.com/loopback7084/astro_super_tools \
        /opt/astro_super_tools \
    && chown -R jenkins:jenkins /opt/astro_super_tools

USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
