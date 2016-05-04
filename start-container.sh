#!/bin/bash

# run N slave containers
N=$1

# the defaut node number is 3
if [ $# = 0 ]
then
	N=3
fi

echo "stopping all the containers running the hadoop-master/slave images"
docker ps -a | grep  amineben/hadoop-* | awk '{print $1 }' | xargs -I {} docker rm -f {}  

# delete old master container and start new master container
docker rm -f master &> /dev/null
echo "start master container..."
docker run -d -t --dns 127.0.0.1 -P  --name master -h master.mondo.com -w /root amineben/hadoop-master:0.2.0 
# get the IP address of master container
FIRST_IP=$(docker inspect --format="{{.NetworkSettings.IPAddress}}" master)

echo "The master IP address is:"$FIRST_IP
# delete old slave containers and start new slave containers
i=1
while [ $i -lt $N ]
do
	docker rm -f slave$i &> /dev/null
	echo "start slave$i container..."
	docker run -d -t --dns 127.0.0.1 -P  --name slave$i -h slave$i.mondo.com -e JOIN_IP=$FIRST_IP amineben/hadoop-slave:0.2.0 
	((i++))
done 

# create a new Bash session in the master container
docker exec -it master bash
