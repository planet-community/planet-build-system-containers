ARG REF=latest

FROM ghcr.io/planet-community/planet-build-system-containers:$REF-planet-jenkins-base-agent-image AS base

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt install -y \
  git \
  openssl \ 
  procps \
  python3-dev \
  python3-pip  \
  sudo 

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && gpasswd -a jenkins sudo

COPY ./build.sh /home/jenkins
RUN chmod a+x /home/jenkins/build.sh

USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
