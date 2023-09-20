ARG REF=main

FROM ghcr.io/shymega/planet-build-system-containers:$REF-planet-jenkins-base-agent-image AS base

ARG CLANG_VERSION=4691093

ENV CCACHE_SIZE=50G \
    CCACHE_DIR=/var/cache/ccache \
    USE_CCACHE=1 \
    CCACHE_COMPRESS=1 \
    PATH=$PATH:/usr/local/bin:/opt/clang/bin:/opt/gcc/bin \
    DEBIAN_FRONTEND=noninteractive

USER root

RUN apt install -y wget sudo gnupg2 software-properties-common apt-transport-https \
    && mkdir -p /etc/apt/keyrings \
    && wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc \
    && echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list \
    && apt update \
    && apt install -y \
    abootimg \
    temurin-8-jdk \
    bc \
    bison \
    build-essential \
    ccache \
    cpio \
    curl \
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
    libtinfo5  \
    libxml2 \
    libxml2-utils \
    lzop \
    maven \
    pngcrush \
    rsync \
    schedtool \
    squashfs-tools \
    xsltproc \
    zip \
    zlib1g-dev \
    && curl -s -o /usr/local/bin/repo https://storage.googleapis.com/git-repo-downloads/repo \
    && chmod a+x /usr/local/bin/repo \
    && mkdir -pv /opt/gcc \
    && curl -s "https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/+archive/refs/heads/pie-release.tar.gz" | tar xzf - -C /opt/gcc \
    && curl -s "https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/pie-release.tar.gz" | tar xzf - -C /opt/ \
    && ln -sf /opt/clang-${CLANG_VERSION} /opt/clang
    
USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
