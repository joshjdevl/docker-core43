ID=$(sudo docker ps | grep 'joshjdevl/core43:latest' | awk '{print $1}')
echo $ID
#PORT=$(sudo docker port $ID 22)
PORT=$(sudo docker inspect $ID | grep HostPort | tail -1 | awk '{print $2}' | tr -d '",\n’')


ssh -oStrictHostKeyChecking=no -oCheckHostIP=no -X root@localhost -p ${PORT}
