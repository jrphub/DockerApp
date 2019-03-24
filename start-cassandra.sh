#start-cassandra
docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "CREATE KEYSPACE gis WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1 };"


docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "CREATE TABLE tweets (id text, text text, createdAt text, source text, lang text, sentiment text, fullText text, location text, country text PRIMARY KEY);"

docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select * from gis.tweets;"
