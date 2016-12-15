[![](https://images.microbadger.com/badges/image/rawmind/alpine-kafka-manager.svg)](https://microbadger.com/images/rawmind/alpine-kafka-manager "Get your own image badge on microbadger.com")

alpine-kafka-manager 
==============

This image is the kafka-manager base. It comes from [alpine-jvm8][alpine-jvm8].

## Versions

- `1.3.8.1` [(Dockerfile)](https://github.com/rawmind0/alpine-kafka-manager/blob/1.3.8.1/Dockerfile)

## Configuration

This image runs [kafka-manager][kafka-manager] with monit. Kafka is started with user and group "kafka".

Besides, you can customize the configuration in several ways:

### Default Configuration

kafka is installed with the default configuration and some parameters can be overrided with env variables:

- KAFKA_HEAP_OPTS="-Xmx1G -Xms1G"     				# Kafka memory value
- KAFKA_SECRET="^<csmm5Fx4d=r2HEX8pelM3iBkFVv?k[mc;IZE<_Qoq8EkX_/7@Zt6dP05Pzea4U"
- KAFKA_ZK="zookeeper:2181"
- KAFKA_USER="admin"
- KAFKA_PASS="password"
- KAFKA_AUTH="false"
- KAFKA_REALM="Kafka-Manager"
- KAFKA_CONSUMER_FILE="/opt/kafka-manager/conf/consumer.properties"


### Custom Configuration

Kafka is installed under /opt/kafka and make use of /opt/kafka/config/server.properties.

You can edit this files in order customize configuration

You could also include FROM rawmind/alpine-kafka at the top of your Dockerfile, and add your custom config.


## Example

See [rancher-example][rancher-example], that run kafka in a rancher system with dynamic configuration.


[alpine-jvm8]: https://github.com/rawmind0/alpine-jvm8/
[kafka-manager]: https://github.com/yahoo/kafka-manager
[rancher-example]: https://github.com/rawmind0/alpine-kafka-manager/tree/master/rancher
