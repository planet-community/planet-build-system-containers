ARG REF=latest

FROM ghcr.io/planet-community/planet-build-system-containers:$REF-planet-jenkins-base-agent-image AS base

LABEL org.opencontainers.image.source "https://github.com/planet-community/build-system-containers"

ARG CLANG_VERSION=4691093

ENV CCACHE_SIZE=50G \
    CCACHE_DIR=/var/cache/ccache \
    USE_CCACHE=1 \
    CCACHE_COMPRESS=1 \
    PATH=$PATH:/usr/local/bin:/opt/clang/bin:/opt/gcc/bin \
    DEBIAN_FRONTEND=noninteractive

USER root
RUN apt -y update \
    && apt -y upgrade \
    && apt -y dist-upgrade \
    && apt -y install \
          bc \
          bison \
          build-essential \
          cpio \
          curl \
          flex \
          git \
          kmod \
          libncurses-dev \
          libncurses5 \
          libssl-dev \
	  python-is-python3 \
          python3-pip \
          wget \
          xz-utils \
          zip \
    && mkdir -pv /opt/gcc \
    && curl "https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/+archive/refs/heads/pie-release.tar.gz" | tar xzf - -C /opt/gcc \
    && curl "https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/pie-release.tar.gz" | tar xzf - -C /opt/ \
    && ln -sf /opt/clang-${CLANG_VERSION} /opt/clang \
    && git clone --depth 1 --branch v0.6.0 https://github.com/PCLineageOS-Ports/android_build_planet_kernel /work/android_build_planet_kernel \
    && cp -Rv /work/android_build_planet_kernel/common /opt/common \
    && mkdir -p /usr/src /out \
    && chown -R jenkins:jenkins /usr/src /out \
    && mkdir /opt/unpackbootimg \
    && git clone --depth 1 --branch 2022.11.09 \
        https://github.com/osm0sis/mkbootimg.git /opt/unpackbootimg \
    && cd /opt/unpackbootimg \
    && make CC=gcc

USER jenkins

ENV DEBIAN_FRONTEND=noninteractive \
    ARCH=arm64 \
    PATH=/opt/clang/bin:/opt/gcc/bin:$PATH \
    CC=clang CXX=clang++ \
    CLANG_TRIPLE=aarch64-linux-gnu- \ 
    CROSS_COMPILE=aarch64-linux-android- \
    CROSS_COMPILE_ARM32=arm-linux-androideabi-

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
