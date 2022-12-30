FROM ghcr.io/shymega/planet-build-system-containers:latest-planet-jenkins-base-agent-image AS base

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt install -y \ 
        maven \
        git \
        openjdk-17-jdk \
    && update-alternatives --set java /usr/lib/jvm/java-17-openjdk-amd64/bin/java

USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
