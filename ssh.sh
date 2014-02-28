ID=$(sudo docker run --privileged -d -p 22 joshjdevl/core43 /usr/sbin/sshd -D)
ID=${ID:0:12}
echo $ID
#PORT=$(sudo docker port $ID 22)
PORT=$(sudo docker inspect $ID | grep HostPort | tail -1 | awk '{print $2}' | tr -d '",\n’')


ssh -X root@localhost -p ${PORT}

