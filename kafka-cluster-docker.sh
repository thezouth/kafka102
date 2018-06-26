#!/bin/bash

DOCKER_NETWORK=kafka102_lab

if ! docker network ls | grep $DOCKER_NETWORK; then
	docker network create $DOCKER_NETWORK
fi

docker run -d --rm --network $DOCKER_NETWORK --name kafka3 -p 9094:9092 -e KAFKA_BROKER_ID=3 -e KAFKA_ADVERTISED_HOST_NAME=kafka3 -e KAFKA_ZOOKEEPER_CONNECT='zk1:2181,zk2:2181,zk3:2181' wurstmeister/kafka:1.1.0
docker run -d --rm --network $DOCKER_NETWORK --name kafka2 -p 9093:9092 -e KAFKA_BROKER_ID=2 -e KAFKA_ADVERTISED_HOST_NAME=kafka2 -e KAFKA_ZOOKEEPER_CONNECT='zk1:2181,zk2:2181,zk3:2181' wurstmeister/kafka:1.1.0
docker run -it --rm --network $DOCKER_NETWORK --name kafka1 -p 9092:9092 -e KAFKA_BROKER_ID=1 -e KAFKA_ADVERTISED_HOST_NAME=kafka1 -e KAFKA_ZOOKEEPER_CONNECT='zk1:2181,zk2:2181,zk3:2181' wurstmeister/kafka:1.1.0

docker stop kafka2 kafka3
docker network rm $DOCKER_NETWORK
