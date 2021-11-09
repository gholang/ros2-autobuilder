FROM buildbot/buildbot-worker:v2.8.4

USER root

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        gawk \
        wget \
        diffstat \
        rsync \
        nfs-common \
        cifs-utils \
        unzip \
        sysstat \
        texinfo \
        build-essential \
        chrpath \
        socat \
        python \
        python3 \
        python3-pip \
        python3-pexpect \
        python3-git \
        python3-jinja2 \
        pylint3 \
        xz-utils  \
        locales \
        cpio \
        screen \
        tmux \
        sudo \
        iputils-ping \
        libegl1-mesa \
        libsdl1.2-dev \
        xterm \
        iproute2 \
        fluxbox \
        tightvncserver \
        zstd && \
    rm -rf /var/lib/apt/lists/* && \
    DEBIAN_FRONTEND=noninteractive /usr/sbin/locale-gen en_US.UTF-8 

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

USER buildbot
