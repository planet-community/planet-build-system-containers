ARG REF=latest

FROM ghcr.io/planet-community/planet-build-system-containers:$REF-planet-jenkins-base-agent-image AS base

LABEL org.opencontainers.image.source "https://github.com/planet-community/build-system-containers"

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN mkdir -p /usr/share/man/man1 \
  && apt install -y \ 
        git \
        maven
	
USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
