echo "Total useful record so far (without sentiment -999)"
docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select count(*) from gis.tweets where sentiment>-999 allow filtering;"

echo "Total record so far"
docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select count(*) from gis.tweets allow filtering;"
