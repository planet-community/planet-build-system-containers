FROM ghcr.io/shymega/planet-build-system-containers:latest-planet-android-rom-builder AS base

USER jenkins

ENV DEBIAN_FRONTEND=noninteractive \
    ARCH=arm64 \
    PATH=/opt/clang/bin:/opt/gcc/bin:$PATH \
    CC=clang CXX=clang++ \
    CLANG_TRIPLE=aarch64-linux-gnu- \ 
    CROSS_COMPILE=aarch64-linux-android- \
    CROSS_COMPILE_ARM32=arm-linux-androideabi-

RUN apt -y install \
  bc \
  bison \
  build-essential \
  cpio \
  curl \
  flex \
  git \
  kmod \
  libncurses5 \
  libncurses-dev \
  libssl-dev \
  python-is-python3 \
  python2 \
  python3 \
  python3-pip \
  wget \
  xz-utils \
  zip

RUN mkdir /opt/unpackbootimg && \
  git clone https://github.com/osm0sis/mkbootimg.git /opt/unpackbootimg && \
  cd /opt/unpackbootimg && \
  make

WORKDIR /work
RUN git clone https://github.com/cawilliamson/android_build_astro_kernel 
COPY /work/common /root/common

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
