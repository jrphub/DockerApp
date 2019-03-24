#ENV Variable
TOPIC=tweets-sentiment
MASTER=local[*]
KAFKA_HOST=kafka:9092
BATCH_CONSUMER_GROUPID=tweets-batch-group
OUTPUT_DIR=/tweetsBatchOutput

#Spark-streaming

docker exec -it $(docker-compose ps -q spark) bash java -jar /apps/LambdaBatchConsumer-0.0.1-SNAPSHOT.jar $KAFKA_HOST $BATCH_CONSUMER_GROUPID $TOPIC $OUTPUT_DIR

