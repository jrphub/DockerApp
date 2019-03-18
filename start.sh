docker-compose down
./post-down.sh

docker-compose up -d

docker ps

#ENV Variable
TOPIC=tweets-ml-demo-01
ZOOKEEPER=kafka:2181
KAFKA_HOME=./opt/kafka_2.11-0.10.1.0

#Setup 1 : Kafka
docker exec -it $(docker-compose ps -q kafka) bash $KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper $ZOOKEEPER --replication-factor 1 --partitions 2 --topic $TOPIC


docker exec -it $(docker-compose ps -q kafka) bash $KAFKA_HOME/bin/kafka-topics.sh --describe --zookeeper $ZOOKEEPER --topic $TOPIC

#Setup 2 : cassandra

