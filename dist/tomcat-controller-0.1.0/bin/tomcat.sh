#!/bin/sh

# The directory where bin/tomcat.sh is located
if [ -z "$CATALINA_HOME" ]; then
    # assume that script is put in Tomcat's bin directory
    CATALINA_HOME="$(cd $(dirname $0)/.. && pwd)"
fi

if [ -z "$1" ]; then
    CMD=start
else
    CMD=$1
fi

# first, initialize the local user's .config
[ -d "${HOME}/.config/tomcat" ] || (
    mkdir -p ${HOME}/.config/tomcat
    cd ${HOME}/.config/tomcat/
    (cd ${CATALINA_HOME} && tar cf - conf logs temp) | tar xf -
    mkdir webapps
    ln -s ${CATALINA_HOME}/webapps/* webapps/
)

export CATALINA_BASE="${HOME}/.config/tomcat"

case "$CMD" in
    start)
	${CATALINA_HOME}/bin/startup.sh
	;;
    stop)
	${CATALINA_HOME}/bin/shutdown.sh
	;;
    restart)
	$0 stop; sleep 5; $0 start
esac