docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select country, count(country) from gis.tweets where sentiment='0' group by country allow filtering;"

docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select country, count(country) from gis.tweets where sentiment='1' group by country allow filtering;"

docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select country, count(country) from gis.tweets where sentiment='2' group by country allow filtering;"

docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select country, count(country) from gis.tweets where sentiment='3' group by country allow filtering;"

docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select country, count(country) from gis.tweets where sentiment='4' group by country allow filtering;"
