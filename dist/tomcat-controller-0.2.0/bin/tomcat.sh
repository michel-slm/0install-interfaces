#!/bin/sh

# The directory where bin/tomcat.sh is located
if [ -z "$CATALINA_HOME" ]; then
    # assume that script is put in Tomcat's bin directory
    CATALINA_HOME="$(cd $(dirname $0)/.. && pwd)"
fi

# first, initialize the local user's .config
[ -d "${HOME}/.config/tomcat" ] || (
    mkdir -p ${HOME}/.config/tomcat
    cd ${HOME}/.config/tomcat/
    (cd ${CATALINA_HOME} && tar cf - conf logs) | tar xf -
    chmod -R u=rwX *
    mkdir webapps
    ln -s ${CATALINA_HOME}/webapps/* webapps/
)

[ -d "/var/tmp/${USER}-tomcat" ] || mkdir "/var/tmp/${USER}-tomcat"

export CATALINA_BASE="${HOME}/.config/tomcat"
export CATALINA_TMPDIR="/var/tmp/${USER}-tomcat"

# set PID file location, if not previously specified
if [ -z "$CATALINA_PID" ]; then
    export CATALINA_PID="${CATALINA_TMPDIR}/pid"
fi

${CATALINA_HOME}/bin/catalina.sh $@
