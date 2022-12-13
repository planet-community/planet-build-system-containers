FROM ghcr.io/shymega/planet-build-system-containers:android-rom AS base

ENV DEBIAN_FRONTEND=noninteractive
USER root

# Copied from `phstudy`
RUN mkdir -p /opt/clang /opt/gcc \
    && apt-get -y install cpio abootimg python2 python3 python libtinfo5 \
    && curl "https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/android-9.0.0_r1/clang-4691093.tar.gz" | tar xzf - -C /opt/clang \
    && curl "https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/+archive/refs/heads/pie-release.tar.gz" | tar xzf - -C /opt/gcc

USER jenkins

ENV ARCH=arm64 \
    PATH=/opt/clang/bin:/opt/gcc/bin:$PATH \
    CC=clang CXX=clang++ \
    CLANG_TRIPLE=aarch64-linux-gnu- \ 
    CROSS_COMPILE=aarch64-linux-android- \
   CROSS_COMPILE_ARM32=arm-linux-androideabi-

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
