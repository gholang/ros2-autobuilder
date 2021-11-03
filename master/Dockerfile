FROM buildbot/buildbot-master:master

RUN useradd -ms /bin/bash buildbot && \
    chown -R buildbot -R /buildbot && \
    usermod -d /buildbot buildbot

USER buildbot
WORKDIR /buildbot
CMD ["dumb-init", "/usr/src/buildbot/start_buildbot.sh"]

