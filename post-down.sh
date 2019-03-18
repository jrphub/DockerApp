echo "Checking whether any port is busy"
echo "kafka:9092"
lsof -i :9092

echo "zookeeper:2181"
lsof -i :2181

echo "spark ports :4040"
lsof -i :4040

echo "spark ports :8080"
lsof -i :8080

echo "spark ports :8081"
lsof -i :8081

echo "cassandra ports :9042"
lsof -i :9042
