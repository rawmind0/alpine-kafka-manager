#!/usr/bin/env sh

SERVICE_HOME=/opt/src
SERVICE_NAME=kafka-manager 
SERVICE_VERSION=1.3.8.1 
SERVICE_URL=https://github.com/yahoo/kafka-manager 

apk --no-cache add git 
cd ${SERVICE_HOME}
git clone -b ${SERVICE_VERSION} ${SERVICE_URL}
cd /opt/src/${SERVICE_NAME}
./sbt clean dist
cd ${SERVICE_NAME}
mv /opt/src/${SERVICE_NAME}/target/universal/${SERVICE_NAME}-${SERVICE_VERSION}.zip .
rm -rf /opt/src/${SERVICE_NAME}
apk del git
rm -rf /var/cache/apk/* /opt/src /root/.sbt

