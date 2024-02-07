ARG REF=latest

FROM ghcr.io/planet-community-org/planet-build-system-containers:$REF-planet-jenkins-base-agent-image AS base

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN mkdir -p /usr/share/man/man1 \
  && apt install -y \ 
        git \
        maven
	
USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
