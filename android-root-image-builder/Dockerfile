FROM ghcr.io/shymega/planet-build-system-containers:latest-planet-android-boot-image-builder AS base

USER root
RUN git clone https://github.com/shymega/magisk-boot-patch-ci-tool /opt/magisk-tools \
    && chown -Rv jenkins:jenkins /opt/magisk-tools
USER jenkins

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
