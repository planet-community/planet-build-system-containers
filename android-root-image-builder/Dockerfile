ARG REF=latest

FROM ghcr.io/planet-community/planet-build-system-containers:$REF-planet-android-boot-image-builder AS base

LABEL org.opencontainers.image.source "https://github.com/planet-community/build-system-containers"

USER root
RUN git clone --depth 1 --branch v1.1.0 https://github.com/shymega/magisk-boot-patch-ci-tool /opt/magisk-tools \
    && chown -Rv jenkins:jenkins /opt/magisk-tools /opt/common /out
USER jenkins

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
