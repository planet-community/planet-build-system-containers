FROM docker.io/jenkins/inbound-agent:latest-jdk11 AS base

ENV CCACHE_SIZE=50G \
    CCACHE_DIR=/var/cache/ccache \
    USE_CCACHE=1 \
    CCACHE_COMPRESS=1 \
    PATH=$PATH:/usr/local/bin \
    DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update \
    && apt-get install -y wget sudo gnupg2 software-properties-common \
    && wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add - \
    && add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get dist-upgrade -y \
    && apt-get install -y \
          android-sdk-platform-tools-common \
          android-tools-adb \
          android-tools-fastboot \
          bc \
          bison \
          build-essential \
          flex \
          g++-multilib \
          gcc-multilib \
          git \
          gnupg \
          gperf \
          imagemagick \
          lib32ncurses5-dev \
          lib32readline-dev \
          lib32z1-dev \
          libesd0-dev \
          liblz4-tool \
          libncurses5-dev \
          libsdl1.2-dev \
          libssl-dev \
          libwxgtk3.0-dev \
          libxml2 \
          libxml2-utils \
          lzop \
          pngcrush \
          rsync \
          schedtool \
          squashfs-tools \
          xsltproc \
          zip \
          zlib1g-dev \
          python \
          procps \
          less \
          vim \
	      bsdmainutils \
	      adoptopenjdk-8-hotspot \
          fakeroot \
	      sudo \
    && rm -rf /var/lib/apt/lists/*

ADD https://storage.googleapis.com/git-repo-downloads/repo /usr/local/bin/repo
RUN chmod a+x /usr/local/bin/repo

USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
