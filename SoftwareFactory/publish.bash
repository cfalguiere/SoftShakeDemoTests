#!/bin/bash

source SoftwareFactory/common.bash
SCRIPT_NAME="Publish"

if [ $# -ne 4 ]; then
	echo "Usage: $0 PROJECT_NAME BUNDLE_VERSION RHOST KEY_PATH"
	exit_ko "Missing parameters $*"
fi

PROJECT_NAME=$1
BUNDLE_VERSION=$2
RHOST=$3
KEY_PATH=$4
#echo "PROJECT_NAME $PROJECT_NAME"
#echo "BUNDLE_VERSION $BUNDLE_VERSION"
#echo "RHOST $RHOST"
#echo "KEY_PATH  $KEY_PATH"
#echo "CI_FOLDER $CI_FOLDER"

### publish process

log "$SCRIPT_NAME: Provisioning $BUNDLE_VERSION ..."

SOURCE_DIR=${CI_FOLDER}/pkg/${BUNDLE_VERSION}
chmod -R a-wx,a+rX,u+w $SOURCE_DIR

DEST_DIR=/var/www/apps/${PROJECT_NAME}/

rsync -av -e "ssh -o IdentityFile=${KEY_PATH}" ${SOURCE_DIR} ${RHOST}:${DEST_DIR}
if [ $? -ne 0 ]; then
        exit_ko "Unable to rsync"
fi

exit_ok "$SCRIPT_NAME: Project published with version ${BUNDLE_VERSION}"


