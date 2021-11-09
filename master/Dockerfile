FROM buildbot/buildbot-master:2.8.x

RUN  adduser -D buildbot -h /buildbot 
USER buildbot
WORKDIR /buildbot
CMD ["dumb-init", "/usr/src/buildbot/docker/start_buildbot.sh"]