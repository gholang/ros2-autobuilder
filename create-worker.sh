#/usr/bin/env sh
echo "Initializing yocto buildbot."
echo "RUN As root:
echo "[Synopsis]
echo "$0 [USER_NAME] [WORKER_NAME] [CONTROLER_ADDR] [PASS]"

DEFAULT_USER=pokybuild
DEFAULT_CONTROLER_ADDR=localhost
DEFAULT_WORKER=yocto-worker
DEFAULT_PASS=pass
BASE_DIR=$PWD

USER_NAME=${1-$DEFAULT_USER}
WORKER_NAME=${2-$DEFAULT_WORKER}
WORKER_DIR=$WORKER_NAME
CONTROLER_ADDR=${3-$DEFAULT_CONTROLER_ADDR}
PASS=${4-$DEFAULT_PASS}

cd /home/$USER_NAME

echo .
echo [Create worker]
echo .
buildbot-worker create-worker -r --umask=0o22 $WORKER_DIR $CONTROLER_ADDR $WORKER_NAME $PASS

chown -R $USER_NAME:$USER_NAME /home/$USER_NAME


