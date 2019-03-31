#start-cassandra
docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "CREATE KEYSPACE gis WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1 };"


docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "CREATE TABLE gis.tweets (id text, text text, createdat text, source text, lang text, sentiment int, fullText text, location text, country text, PRIMARY KEY (country, sentiment)) with clustering order by (sentiment ASC);"

docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select * from gis.tweets;"
