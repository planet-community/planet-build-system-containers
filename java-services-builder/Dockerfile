FROM ghcr.io/shymega/planet-build-system-containers:enable-other-images-planet-jenkins-base-agent-image AS base

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update \
    && apt-get install -y \ 
    maven \
    git

USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
