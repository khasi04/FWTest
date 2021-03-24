#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <version>"
  exit 1
fi

set -x

SDK_VERSION=$1

SDK_ROOT_DIR=releases/download
CONFIGURATION_BUILD_DIR=build

create_sdk () {
	SDK_NAME=$1
	CONF=$2
	SDK_DIR=$SDK_ROOT_DIR/${SDK_VERSION}/$SDK_NAME
	mkdir -p $SDK_DIR

	cp -rf "${CONFIGURATION_BUILD_DIR}/${CONF}-iphoneos/FWTest.framework" $SDK_DIR

  (cd $SDK_ROOT_DIR//${SDK_VERSION} && zip -r $SDK_NAME.zip $SDK_NAME)
}

create_sdk FWTest "Release"
