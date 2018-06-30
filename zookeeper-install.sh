#/bin/bash
# Download and unarchive zookeeper
curl -O http://www-eu.apache.org/dist/zookeeper/zookeeper-3.4.12/zookeeper-3.4.12.tar.gz

tar -xvf zookeeper-3.4.12.tar.gz
cd zookeeper-3.4.12

# Create config file
cp conf/zoo_sample.cfg conf/zoo.cfg

# Start zookeeper
./bin/zkServer.sh start conf/zoo.cfg

# Check zookeeper alive
echo ruok | nc localhost 2181

# Stop zookeeper
./bin/zkServer.sh stop conf/zoo.cfg
