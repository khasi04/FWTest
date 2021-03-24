#!/bin/bash
set -x

CONFIGURATION_BUILD_DIR=build/
mkdir -p $CONFIGURATION_BUILD_DIR

create_framework() {
	CONF=$1
	
	UNIVERSAL_DIR=${CONFIGURATION_BUILD_DIR}/${CONF}-universal
	echo ${UNIVERSAL_DIR}
	
	rm -rf "${UNIVERSAL_DIR}"
	mkdir -p "${UNIVERSAL_DIR}"

	xcodebuild -project FWTest.xcodeproj -sdk iphoneos -target "FWTest" -configuration "${CONF}" ONLY_ACTIVE_ARCH=NO clean build
	

	cp -R "${CONFIGURATION_BUILD_DIR}/${CONF}-iphoneos/FWTest.framework" "${UNIVERSAL_DIR}/"

}

create_framework "Release"

