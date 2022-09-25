FROM docker.io/jenkins/inbound-agent:latest-jdk11 AS base


ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get dist-upgrade -y \
  && apt-get install -y \
  git \
  python3-pip  \
  python3-dev \
  sudo  \
  openssl \ 
  procps \
  sudo \
  && pip3 install -U pmbootstrap

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN gpasswd -a jenkins sudo

USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
