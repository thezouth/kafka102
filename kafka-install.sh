#!/bin/bash

# Download and unarchive Kafka.
curl -O http://www-eu.apache.org/dist/kafka/1.1.0/kafka_2.11-1.1.0.tgz

tar -xvf kafka_2.11-1.1.0.tgz
cd kafka_2.11-1.1.0

# Start Kafka
./bin/kafka-server-start.sh config/server.properties
