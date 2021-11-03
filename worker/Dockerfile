FROM buildbot/buildbot-worker:master

# installed packages from buildbot-worker
#RUN RUN apt-get update && \
#    DEBIAN_FRONTEND=noninteractive apt-get install -y \
#    build-essential \
#    git \
#    subversion \
#    python3-dev \
#    libffi-dev \
#    libssl-dev \
#    python3-setuptools \
#    python3-pip \
#    dumb-init \
#    curl && 
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
        lz4 \
        zstd && \
    	rm -rf /var/lib/apt/lists/* 

USER buildbot
