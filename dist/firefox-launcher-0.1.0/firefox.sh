#!/bin/sh

MOZ_ARCH=$(uname -m)
MOZ_LIB_DIR="/usr/lib"

case $MOZ_ARCH in
    x86_64 | s390x | sparc64)
	if [ -d "/usr/lib64" ]; then
	    MOZ_LIB_DIR="/usr/lib64"
	fi
	;;
esac

if [ -x "/usr/bin/mozilla-plugin-config" ]; then
    MOZ_PLUGIN_DIR="plugins-wrapped"
else
    MOZ_PLUGIN_DIR="plugins"
fi

case ":${MOZ_PLUGIN_PATH:-}:" in
    *:${MOZ_LIB_DIR}/mozilla/${MOZ_PLUGIN_DIR}:*) ;;
    *) MOZ_PLUGIN_PATH="${MOZ_LIB_DIR}/mozilla/${MOZ_PLUGIN_DIR}${MOZ_PLUGIN_PATH:+:$MOZ_PLUGIN_PATH}" ;;
esac

export MOZ_PLUGIN_PATH

if [ -z "${FIREFOX_HOME}" ]; then
    FIREFOX_HOME=`dirname $0`
fi

${FIREFOX_HOME}/firefox $@
