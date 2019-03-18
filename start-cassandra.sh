#start-cassandra
docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "CREATE KEYSPACE gis WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1 };"


docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "CREATE TABLE gis.tweetlive (id text PRIMARY KEY, text text, createdAt text, source text, lang text, sentiment text);"

docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select * from gis.tweetlive;"
