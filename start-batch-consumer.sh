#ENV Variable
TOPIC=tweets-sentiment
MASTER=local[*]
KAFKA_HOST=kafka:9092
BATCH_CONSUMER_GROUPID=tweets-batch-group
OUTPUT_DIR=/home/ubuntu/tweetsBatchOutput

#Spark-streaming

docker exec -it $(docker-compose ps -q spark) bash spark-submit --class com.lambda.consumer.LambdaBatchConsumer.App --master $MASTER /apps/LambdaBatchConsumer-0.0.1-SNAPSHOT.jar $KAFKA_HOST $BATCH_CONSUMER_GROUPID $TOPIC $OUTPUT_DIR
