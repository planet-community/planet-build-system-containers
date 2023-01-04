FROM ghcr.io/shymega/planet-build-system-containers:latest-planet-android-rom-builder AS base

USER root
RUN apt -y install \
         kmod \
         libssl-dev \
         python-is-python3 \
         python3-pip \
         wget \
	 mkbootimg \
	 gcc \
         xz-utils \
    && git clone --depth 1 --branch v0.3.0 https://github.com/PCLineageOS-Ports/android_build_planet_kernel /work/android_build_astro_kernel \
    && cp -Rv /work/android_build_astro_kernel/common /opt/common \
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
