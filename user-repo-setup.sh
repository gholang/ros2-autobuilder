#/usr/bin/env sh
echo "Initializing yocto buildbot."
echo "RUN As root:
echo "[Synopsis]
echo "$0 [USER_NAME] [CONTROLER_NAME] [WORKER_NAME] [CONTROLER_ADDR] [PASS]"

DEFAULT_USER=pokybuild
DEFAULT_CONTROLER=yocto-controller
DEFAULT_CONTROLER_ADDR=localhost
DEFAULT_WORKER=yocto-worker
DEFAULT_PASS=pass
BASE_DIR=$PWD

AUTOBUILDER_GIT_URL=https://git.yoctoproject.org/git/yocto-autobuilder2
AUTOBUILDER_HELPER_GIT_URL=https://git.yoctoproject.org/git/yocto-autobuilder-helper


USER_NAME=${1-$DEFAULT_USER}
CONTROLER_NAME=${2-$DEFAULT_CONTROLER}
WORKER_NAME=${4-$DEFAULT_WORKER}
WORKER_DIR=$WORKER_NAME
CONTROLER_ADDR=${3-$DEFAULT_CONTROLER_ADDR}
PASS=${3-$DEFAULT_PASS}

echo .
echo [DELETE USER ${USER_NAME}]
echo .

deluser $USER_NAME
rm -rf /home/$USER_NAME

echo .
echo [ADD USER ${USER_NAME}]
echo .

useradd -m --system -s /usr/bin/bash $USER_NAME 

cd /home/$USER_NAME

echo .
echo [Create master]
echo .
buildbot create-master -r $CONTROLER_NAME
echo .
echo [Create master]
echo .
buildbot-worker create-worker -r --umask=0o22 $WORKER_DIR $CONTROLER_ADDR $WORKER_NAME $PASS
echo .
echo [File Copy...]
echo .
cd $CONTROLER_NAME
#git clone $AUTOBUILDER_GIT_URL  yoctoabb
cp -aR $BASE_DIR/yoctoabb .
ln -rs yoctoabb/master.cfg master.cfg

cd - 

#git clone $AUTOBUILDER_HELPER_GIT_URL
cp -aR $BASE_DIR/yocto-autobuilder-helper .

echo 'export LANG=en_US.UTF-8' >> /home/$USER_NAME/.bashrc

chown -R $USER_NAME:$USER_NAME /home/$USER_NAME

