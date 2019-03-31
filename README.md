### Running the docker

Inside dockerApp directory

```shell
#Inside docker-app directory
sudo -i
```

put publisher uber jar inside kafka-publisher/jars

and

put spark streaming consumer uber jar inside spark-consumer/jars

put spark batch consumer uber jar inside spark-consumer/jars

The directory structure will look like below:

![1554038393095](/home/jrp/.config/Typora/typora-user-images/1554038393095.png)

Then run below commands

```shell
#PART-1 : Set up
#To connect to AWS EC2 instance from local ubuntu machine
ssh -i dev-hatim-keypair.pem ubuntu@ec2-18-130-80-80.eu-west-2.compute.amazonaws.com

sudo -i
cd DockerApp

#Inside DockerApp
#To start the docker containers using docker-compose
#Edit and view the file, if there is any change is needed (optional)
#This script starts docker containers for spark, cassandra and kafka
#creates kafka topic (TOPIC=tweets-sentiment)
./start.sh

#To create cassandra table (gis.tweets)
./start-cassandra.sh

#PART-2 : start stream consumer
#To start streaming consumer, reading from topic (tweets-sentiment) as consumer group (tweets-stream-group)
./start-stream-consumer.sh

#Let the consumer running
#-------------------------------------------------------


#PART-3 : start publisher
#Open another terminal
#To connect to AWS EC2 instance from local ubuntu machine
ssh -i dev-hatim-keypair.pem ubuntu@ec2-18-130-80-80.eu-west-2.compute.amazonaws.com

sudo -i
cd DockerApp

#To start publisher
#Publish the data to topic (TOPIC=tweets-sentiment)
docker exec -it $(docker-compose ps -q kafka) bash
#The above command will make login to kafka container inside docker
#run below command from inside container, the keyword can be changed
java -jar /apps/LambdaPublisher-0.0.1-SNAPSHOT.jar kafka:9092 tweets-sentiment '#Trump'


#Let the publisher running
#-------------------------------------------------------


#PART-4 : Statistics
#Open another terminal
#To connect to AWS EC2 instance from local ubuntu machine
ssh -i dev-hatim-keypair.pem ubuntu@ec2-18-130-80-80.eu-west-2.compute.amazonaws.com

sudo -i
cd DockerApp

#To check the count per sentiment country-wise
# 0 being most negative
# 4 being most positive
./check-stats.sh

#To check the count of total records
./check-count.sh
#-------------------------------------------------------


#PART-5 : Running Batch Consumer
#To run batch consumer

#Open another terminal
#To connect to AWS EC2 instance from local ubuntu machine
ssh -i dev-hatim-keypair.pem ubuntu@ec2-18-130-80-80.eu-west-2.compute.amazonaws.com

sudo -i
cd DockerApp

./start-batch-consumer.sh

# This batch component will pull the data from TOPIC=tweets-sentiment,
# uses spark to store the data to OUTPUT_DIR=/tweetsBatchOutput
# go to /tweetsBatchOutput to see the output

docker exec -it $(docker-compose ps -q spark) bash

cd /tweetsBatchOutput
ls -lrt

#change to the last directory in the list
cd <last directory in the list>

#count the records processed
cat part-* | wc -l
#view the output
cat part-00000
```

To check Publisher is running

```shell
ps -ef | grep LambdaPublisher
```

To check Spark Streaming is running

```shell
ps -ef | grep LambdaStreamConsumer
```

