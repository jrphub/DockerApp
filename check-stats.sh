echo "Countries with negative views : "
docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select country,sentiment, count(country) from gis.tweets where sentiment IN (1,2) group by country, sentiment allow filtering;"

echo "Countries with positive views : "
docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select country,sentiment, count(country) from gis.tweets where sentiment IN (3,4) group by country, sentiment allow filtering;"

echo "Feel of each country : (the more value is positive, the more people feels good) : "
docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select country, avg(sentiment) from gis.tweets where sentiment>-999 group by country allow filtering"

echo "Countries with their views (0 being most negative, 4 being most positive)"
echo "========================================================================="
echo "countries with most negative view:"
docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select country, count(country) from gis.tweets where sentiment=0 group by country allow filtering;"

echo "countries with negative view:"
docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select country, count(country) from gis.tweets where sentiment=1 group by country allow filtering;"

echo "countries with neutral views:"
docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select country, count(country) from gis.tweets where sentiment=2 group by country allow filtering;"

echo "countries with positive views:"
docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select country, count(country) from gis.tweets where sentiment=3 group by country allow filtering;"

echo "countries with most positive views:"
docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select country, count(country) from gis.tweets where sentiment=4 group by country allow filtering;"

echo "How the whole world thinks so far ... (Postive is better)"
docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select avg(sentiment) from gis.tweets where sentiment>-999 allow filtering;"

echo "Total record so far"
docker exec -it $(docker-compose ps -q cassandra) cqlsh -e "select count(*) from gis.tweets where sentiment>-999 allow filtering;"
