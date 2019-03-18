#ENV Variable
TOPIC=tweets-ml-demo-01
MASTER=local[*]
KAFKA_HOST=kafka:9092
STREAM_CONSUMER_GROUPID=tweet-demo-live-group

#Spark-streaming

docker exec -it $(docker-compose ps -q spark) bash spark-submit --class com.lambda.consumer.LambdaStreamConsumer.App --master $MASTER --conf spark.cassandra.connection.host=cassandra /apps/LambdaStreamConsumer-0.0.1-SNAPSHOT.jar $KAFKA_HOST $STREAM_CONSUMER_GROUPID $TOPIC
