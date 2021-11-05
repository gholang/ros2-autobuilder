FROM buildbot/buildbot-master:master

RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install locales && \
    useradd -ms /bin/bash buildbot && \
    chown -R buildbot -R /buildbot && \
    usermod -d /buildbot buildbot && \
    DEBIAN_FRONTEND=noninteractive /usr/sbin/locale-gen en_US.UTF-8 && \
    rm -rf /var/lib/apt/lists/* 

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

USER buildbot
WORKDIR /buildbot
CMD ["dumb-init", "/usr/src/buildbot/start_buildbot.sh"]

