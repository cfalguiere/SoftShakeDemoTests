#!/bin/bash


source SoftwareFactory/common.bash 

### Initializations

BUNDLE_VERSION=DEVELOPMENT
if [ $# -eq 1 ]; then
    BUNDLE_VERSION=$1
fi
if [ $# -gt 1 ]; then
	echo "Usage: $0 [RELEASE_ID]"
fi


### release process

#il va le faire tout seul
#log_section "PUSH"
# si je push je risque d'introduire d'autres choses 
#log "Pushing current version"
#./push.sh 2>&1 1>>$LOG_FILE
#if [ $? -ne 0 ]; then
#        exit_ko "Unable to push"
#fi

cd $CI_FOLDER

log_section "PROVISIONING ${BUNDLE_VERSION}"

/usr/libexec/PlistBuddy -c "Set :CFBundleVersion '${BUNDLE_VERSION}'" $INFO_NAME
log "${INFO_NAME} CFBundleVersion has been set to ${BUNDLE_VERSION}"

log "Provisioning project ${PROJECT_NAME} with version ${BUNDLE_VERSION}"
log "Running rake deploy"
#rake deploy >>$LOG_FILE 2>&1
rake deploy 2>&1 | tee -a $LOG_FILE
BUILD_RESULT=$?
if [ $BUILD_RESULT -ne 0 ]; then
        exit_ko "Unable to provision"
fi

cd ${PROJECT_DIR} 
exit_ok "Project ${PROJECT_NAME} published with version ${BUNDLE_VERSION}"


