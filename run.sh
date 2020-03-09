#!/bin/bash
# Author: silence
# Date: 2018/07/20
# Description: 用于容器内部启动tomcat
# Usage: /bin/bash /home/tomcat/run.sh PROJECT_NAME PRE

PROJECT_NAME=$1
JUDGE_ENV=$2
DIR_PATH=`pwd`
DOCKER_LOG_PATH=/data/logs

if [ "${PROJECT_NAME}" == "" ];then
    echo "Usage: /home/tomcat/run.sh project_name [dev|test|pre|prod]"
    exit 1
fi

if [ "${PROJECT_NAME}" == "" ];then
    echo "Usage: /home/tomcat/run.sh project_name [dev|test|pre|prod]"
    exit 1
fi

if [ "$JUDGE_ENV" != "pre" ] && [ "$JUDGE_ENV" != "test" ] && [ "$JUDGE_ENV" != "pre" ] &&[ "$JUDGE_ENV" != "prod" ];then
    echo "Usage: /home/tomcat/run.sh project_name [dev|test|pre|prod]"
    exit 1
fi

if [ ! -d ${DOCKER_LOG_PATH}/${PROJECT_NAME} ];then
    /usr/bin/mkdir -p ${DOCKER_LOG_PATH}/${PROJECT_NAME}
fi

export JAVA_HOME=${DIR_PATH}/jdk1.8
export CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar
export PATH=$JAVA_HOME/bin:$PATH
export TOMCAT_HOME=${DIR_PATH}/tomcat8
export START_ENV=$JUDGE_ENV

TOMCAT_START=${TOMCAT_HOME}/bin/catalina.sh
/usr/bin/ln -s ${DOCKER_LOG_PATH}/${PROJECT_NAME} ${TOMCAT_HOME}/logs

${TOMCAT_START} run
