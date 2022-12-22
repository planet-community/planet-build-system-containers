FROM ghcr.io/shymega/planet-build-system-containers:latest-planet-android-boot-image-builder AS base

USER jenkins

ENV DEBIAN_FRONTEND=noninteractive \
    ARCH=arm64 \
    PATH=/opt/clang/bin:/opt/gcc/bin:$PATH \
    CC=clang CXX=clang++ \
    CLANG_TRIPLE=aarch64-linux-gnu- \ 
    CROSS_COMPILE=aarch64-linux-android- \
    CROSS_COMPILE_ARM32=arm-linux-androideabi-

USER root
RUN git clone https://github.com/shymega/magisk-boot-patch-ci-tool /opt/magisk-tools \
    && chown -Rv jenkins:jenkins /opt/magisk-tools
USER jenkins

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
