#!/usr/bin/env bash

KAFKA_SECRET=${KAFKA_SECRET:-"^<csmm5Fx4d=r2HEX8pelM3iBkFVv?k[mc;IZE<_Qoq8EkX_/7@Zt6dP05Pzea4U"}
KAFKA_ZK=${KAFKA_ZK:-"zookeeper:2181"}
KAFKA_USER=${KAFKA_USER:-"admin"}
KAFKA_PASS=${KAFKA_PASS:-"password"}
KAFKA_AUTH=${KAFKA_AUTH:-"false"}
KAFKA_REALM=${KAFKA_REALM:-"Kafka-Manager"}
KAFKA_CONSUMER_FILE=${KAFKA_CONSUMER_FILE:-${SERVICE_HOME}"/conf/consumer.properties"}

cat << EOF > ${SERVICE_CONF}
# Copyright 2015 Yahoo Inc. Licensed under the Apache License, Version 2.0
# See accompanying LICENSE file.

# This is the main configuration file for the application.
# ~~~~~

# Secret key
# ~~~~~
# The secret key is used to secure cryptographics functions.
# If you deploy your application to several instances be sure to use the same key!
play.crypto.secret="${KAFKA_SECRET}"

# The application languages
# ~~~~~
play.i18n.langs=["en"]

play.http.requestHandler = "play.http.DefaultHttpRequestHandler"
play.http.context = "/"
play.application.loader=loader.KafkaManagerLoader

kafka-manager.zkhosts="${KAFKA_ZK}"
pinned-dispatcher.type="PinnedDispatcher"
pinned-dispatcher.executor="thread-pool-executor"
application.features=["KMClusterManagerFeature","KMTopicManagerFeature","KMPreferredReplicaElectionFeature","KMReassignPartitionsFeature"]

akka {
  loggers = ["akka.event.slf4j.Slf4jLogger"]
  loglevel = "INFO"
}


basicAuthentication.enabled=${KAFKA_AUTH}
basicAuthentication.username="${KAFKA_USER}"
basicAuthentication.password="${KAFKA_PASS}"
basicAuthentication.realm="${KAFKA_REALM}"


kafka-manager.consumer.properties.file="${KAFKA_CONSUMER_FILE}"
EOF

