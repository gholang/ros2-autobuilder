#/usr/bin/env sh
DEFAULT_USER=pokybuild
BASE_DIR=$PWD

USER_NAME=${1-$DEFAULT_USER}

echo .
echo [File Copy...]
echo .

cp -aR $BASE_DIR/yoctoabb /home/$USER_NAME/

cp -aR $BASE_DIR/yocto-autobuilder-helper /home/$USER_NAME/

chown -R $USER_NAME:$USER_NAME /home/$USER_NAME

