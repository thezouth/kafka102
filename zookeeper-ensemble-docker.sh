#!/bin/bash

DOCKER_NETWORK=kafka102_lab

if ! docker network ls | grep $DOCKER_NETWORK; then
	docker network create $DOCKER_NETWORK
fi

docker run -d --rm --network $DOCKER_NETWORK --name zk3 -e ZOO_MY_ID=3 -p 2183:2181 -e ZOO_SERVERS='server.1=zk1:2888:3888 server.2=zk2:2888:3888 server.3=zk3:2888:3888' zookeeper
docker run -d --rm --network $DOCKER_NETWORK --name zk2 -e ZOO_MY_ID=2 -p 2182:2181 -e ZOO_SERVERS='server.1=zk1:2888:3888 server.2=zk2:2888:3888 server.3=zk3:2888:3888' zookeeper
docker run -it --rm --network $DOCKER_NETWORK --name zk1 -e ZOO_MY_ID=1 -p 2181:2181 -e ZOO_SERVERS='server.1=zk1:2888:3888 server.2=zk2:2888:3888 server.3=zk3:2888:3888' zookeeper

docker stop zk2 zk3
docker network rm $DOCKER_NETWORK
