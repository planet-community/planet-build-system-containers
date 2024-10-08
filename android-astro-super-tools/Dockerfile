ARG REF=latest

FROM ghcr.io/planet-community/planet-build-system-containers:$REF-planet-android-boot-image-builder AS base

LABEL org.opencontainers.image.source "https://github.com/planet-community/build-system-containers"

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt -y update \
    && apt -y upgrade \
    && apt -y dist-upgrade \
    && apt -y install \
        clang \
    && git clone https://github.com/loopback7084/astro_super_tools \
        /opt/astro_super_tools \
    && chown -R jenkins:jenkins /opt/astro_super_tools

USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
