FROM ghcr.io/shymega/planet-build-system-containers:latest-planet-android-rom-builder AS base

USER root
ENV DEBIAN_FRONTEND=noninteractive \
    ARCH=arm64 \
    PATH=/opt/clang/bin:/opt/gcc/bin:$PATH \
    CC=clang CXX=clang++ \
    CLANG_TRIPLE=aarch64-linux-gnu- \ 
    CROSS_COMPILE=aarch64-linux-android- \
    CROSS_COMPILE_ARM32=arm-linux-androideabi-

RUN apt -y install \
         kmod \
         libssl-dev \
         python-is-python3 \
         python3-pip \
         wget \
         xz-utils \
    && mkdir /opt/unpackbootimg \
    && git clone https://github.com/osm0sis/mkbootimg.git /opt/unpackbootimg \
    && cd /opt/unpackbootimg \
    && make \
    && git clone https://github.com/cawilliamson/android_build_astro_kernel  /work/android_build_astro_kernel \
    && cp -Rv /work/android_build_astro_kernel/common /opt/common

USER jenkins
ENV DEBIAN_FRONTEND=noninteractive \
    ARCH=arm64 \
    PATH=/opt/clang/bin:/opt/gcc/bin:$PATH \
    CC=clang CXX=clang++ \
    CLANG_TRIPLE=aarch64-linux-gnu- \ 
    CROSS_COMPILE=aarch64-linux-android- \
    CROSS_COMPILE_ARM32=arm-linux-androideabi-

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
