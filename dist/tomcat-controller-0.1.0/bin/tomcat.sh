#!/bin/sh

DIRNAME=$(cd $(dirname $0)/.. && pwd)

if [ -z "$1" ]; then
    CMD=start
else
    CMD=$1
fi

# first, initialize the local user's .config
[ -d "${HOME}/.config/tomcat" ] || (
    mkdir -p ${HOME}/.config/tomcat
    cd ${HOME}/.config/tomcat/
    (cd ${DIRNAME} && tar cf - conf logs temp) | tar xf -
    mkdir webapps
    ln -s ${DIRNAME}/webapps/* webapps/
)

export CATALINA_BASE="${HOME}/.config/tomcat"

case "$CMD" in
    start)
	${DIRNAME}/bin/startup.sh
	;;
    stop)
	${DIRNAME}/bin/shutdown.sh
	;;
    restart)
	$0 stop; sleep 5; $0 start
esac