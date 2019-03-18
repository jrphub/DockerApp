docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select count(*) from gis.tweetlive where sentiment='0' allow filtering;"

docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select count(*) from gis.tweetlive where sentiment='1' allow filtering;"

docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select count(*) from gis.tweetlive where sentiment='2' allow filtering;"

docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select count(*) from gis.tweetlive where sentiment='3' allow filtering;"

docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select count(*) from gis.tweetlive where sentiment='4' allow filtering;"
