FROM ghcr.io/shymega/planet-build-system-containers:android-rom-builder AS base

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update \
    && apt-get install -y \ 
        git \
        build-essential \
        clang \
        zlib1g-dev

USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
