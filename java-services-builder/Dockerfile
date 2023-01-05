FROM ghcr.io/shymega/planet-build-system-containers:latest-planet-jenkins-base-agent-image AS base

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt install -y \ 
        git \
        maven
	
USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
