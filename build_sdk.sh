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
	
#	xcodebuild -project FWTest.xcodeproj -sdk iphonesimulator -target "FWTest" -configuration "${CONF}" ONLY_ACTIVE_ARCH=NO "EXCLUDED_ARCHS=arm64 arm64e armv7 armv7s armv6 armv8" clean build
	xcodebuild -project FWTest.xcodeproj -sdk iphonesimulator -target "FWTest" -configuration "${CONF}" ONLY_ACTIVE_ARCH=NO  clean build

	cp -R "${CONFIGURATION_BUILD_DIR}/${CONF}-iphoneos/FWTest.framework" "${UNIVERSAL_DIR}/"
	
	cp -R "${CONFIGURATION_BUILD_DIR}/${CONF}-iphonesimulator/FWTest.framework/Modules/FWTest.swiftmodule/." "${UNIVERSAL_DIR}/FWTest.framework/Modules/FWTest.swiftmodule"

#	lipo -create -output "${UNIVERSAL_DIR}/FWTest.framework/FWTest" "${CONFIGURATION_BUILD_DIR}/${CONF}-iphonesimulator/FWTest.framework/FWTest" "${CONFIGURATION_BUILD_DIR}/${CONF}-iphoneos/FWTest.framework/FWTest"

}

create_framework "Release"

