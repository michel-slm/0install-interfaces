#!/bin/sh
if [ -z "${IDEA_HOME}" ]; then
    if [ -x `dirname $0`/bin/idea.sh ]; then
	# launcher used with a manual IDEA installation
	IDEA_HOME=`dirname $0`
    else
	# don't know where IDEA is
	echo Error: IntelliJ IDEA installation not found.
	echo Either set IDEA_HOME or place this script at
	echo the root of your IDEA installation
	exit 1
    fi
fi

if [ -z "$IDEA_JDK" ] && [ -z "$JDK_HOME" ] && [ -z "$JAVA_HOME" ]; then
    # no user-specified Java SDK; using the one that provides javac
    export IDEA_JDK="$(cd "$(dirname $(readlink -f `which javac`))/../" && pwd)"
fi

$IDEA_HOME/bin/idea.sh $@
