apt update && \
apt install git build-essential python3-pip virtualenv enchant npm libcppunit-subunit-dev dumb-init && \
pip3 install buildbot buildbot-www buildbot-waterfall-view buildbot-console-view buildbot-grid-view buildbot-worker testtools

exit 0
