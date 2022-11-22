FROM docker.io/jenkins/inbound-agent:latest-jdk11 AS base

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update \
    && apt-get install -y wget sudo gnupg2 software-properties-common \
    && wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add - \
    && add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get dist-upgrade -y \
    && apt-get install -y \ 
        git-core \
        build-essential \
        clang \
        bc \
        bison \
        gcc-multilib \
        g++-multilib \
        unzip \
        libssl-dev \
        zip \
        zlib1g-dev \
        adoptopenjdk-8-hotspot

# Copied from `phstudy`
ENV NDK_VERSION r17c

RUN mkdir -p /opt/ndk \
	&& curl -sLO https://dl.google.com/android/repository/android-ndk-${NDK_VERSION}-linux-x86_64.zip \
	&& unzip android-ndk-${NDK_VERSION}-linux-x86_64.zip -d /opt/ndk \
	&& rm android-ndk-${NDK_VERSION}-linux-x86_64.zip

ENV ARCH=arm64
ENV CROSS_COMPILE=/opt/ndk/android-ndk-${NDK_VERSION}/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-
ENV CROSS_COMPILE_ARM32=/opt/ndk/android-ndk-${NDK_VERSION}/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-

USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
