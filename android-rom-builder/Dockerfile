FROM ghcr.io/shymega/planet-build-system-containers:latest-planet-jenkins-base-agent-image AS base

ARG CLANG_VERSION=4691093

ENV CCACHE_SIZE=50G \
    CCACHE_DIR=/var/cache/ccache \
    USE_CCACHE=1 \
    CCACHE_COMPRESS=1 \
    PATH=$PATH:/usr/local/bin:/opt/clang/bin:/opt/gcc/bin \
    DEBIAN_FRONTEND=noninteractive

USER root

RUN apt install -y wget sudo gnupg2 software-properties-common \
    && wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add - \
    && add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ \
    && apt update \
    && apt install -y \
    bc \
    abootimg \
    bison \
    curl \
    cpio \
    python2 \
    python3 \
    python \
    libtinfo5  \
    build-essential \
    ccache \
    curl \
    flex \
    g++-multilib \
    gcc-multilib \
    git \
    gperf \
    imagemagick \
    lib32ncurses5-dev \
    lib32readline-dev \
    lib32z1-dev \
    liblz4-tool \
    libncurses5-dev \
    libsdl1.2-dev \
    libssl-dev \
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
    adoptopenjdk-8-hotspot \
    maven \
    && curl -s -o /usr/local/bin/repo https://storage.googleapis.com/git-repo-downloads/repo \
    && chmod a+x /usr/local/bin/repo \
    && mkdir -pv /opt/clang /opt/gcc \
    && curl -L -o /var/tmp/gcc.tar.gz https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/+archive/pie-release.tar.gz \
    && mkdir -p /opt/gcc \
    && tar -xvpf /var/tmp/gcc.tar.gz -C /opt/gcc \
    && rm -f /var/tmp/gcc.tar.gz \
    && curl -L -o /var/tmp/clang.tar.gz https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/pie-release.tar.gz \
    && tar -xvpf /var/tmp/clang.tar.gz -C /opt \
    && ln -sf /opt/clang-${CLANG_VERSION} /opt/clang \
    && rm -f /var/tmp/clang.tar.gz

USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
