FROM docker.io/jenkins/inbound-agent:latest-jdk11 AS base

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get dist-upgrade -y \
    && apt-get install -y \ 
        git \
        build-essential \
        clang \
        zlib1g-dev

USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
