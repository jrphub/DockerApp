#ENV Variable
TOPIC=tweets-ml-demo-01
KAFKA_HOST=kafka:9092
KEYWORD="'#trending'"

docker exec -it $(docker-compose ps -q kafka) java -jar /apps/LambdaPublisher-0.0.1-SNAPSHOT.jar $KAFKA_HOST $TOPIC $KEYWORD
