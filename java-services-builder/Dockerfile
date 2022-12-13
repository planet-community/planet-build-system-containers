FROM ghcr.io/shymega/planet-build-system-containers:latest-planet-java-services-builder AS base

FROM docker.io/jenkins/inbound-agent:latest-jdk11 AS base

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update \
    && apt-get install -y \ 
    maven \
    git

USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
