### Running the docker

Inside dockerApp directory

put your publisher uber jar inside kafka-publisher/jars

and

put your spark streaming uber jar inside spark-stream-consumer/jars



Then run below commands

```shell
#Inside docker-app directory
    sudo -i
    ./start.sh
    
#Step-2 : start cassandra
    ./start-cassandra.sh
    
#Step-3 : start Publisher
    ./start-publisher.sh
    
#Step-4 : Open another terminal
#Inside docker-app directory
    sudo -i
    ./start-stream-consumer.sh
    
#Step-5 : Open another terminal
#Inside docker-app directory
    sudo -i
    ./check-stats.sh
    
#The above command shows the count per sentiment basis
#Run the check-stats command multiple times to check the count
```

