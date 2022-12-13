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
    && apt-get install -y \
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
    && curl -s "https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/android-9.0.0_r1/clang-4691093.tar.gz" | tar xzf - -C /opt/clang \
    && curl -s "https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/+archive/refs/heads/pie-release.tar.gz" | tar xzf - -C /opt/gcc


USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
