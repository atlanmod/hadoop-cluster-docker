#!/bin/bash

hadoop_folder="hadoop-2.6.0"
tag="0.2.0"

if [ $# = 0 ]
then
	echo "Please use image name as the argument!"
	exit 1
fi

if [ $# = 2 ]
then
	hadoop_folder=$2
	echo "the hadoop folder you specified is:"$hadoop_folder
fi

image=$1


# founctions for delete images
function docker_rmi_original()
{
	echo -e "\nsudo docker rmi kiwenlau/$1:0.1.0"
	docker rmi -f kiwenlau/$1:$tag
}

function docker_rmi()
{
	echo -e "\nsudo docker rmi amineben/$1:$tag"
	docker rmi -f amineben/$1:$tag
}

# founctions for build images
function docker_build_original()
{
	cd $1
	echo -e "\n\nsudo docker build -t kiwenlau/$1:0.1.0 ."
	/usr/bin/time -f "real  %e" docker build -t kiwenlau/$1:0.1.0 .
	cd ..
}

function docker_build()
{
	cd $1
	echo -e "\n\nsudo docker build -t amineben/$1:$tag ."
	/usr/bin/time -f "real  %e" docker build -t amineben/$1:$tag .
	cd ..
}

echo -e "Removing all containers running on the hadoop-master/slave images"

docker ps -a | grep  amineben/hadoop-* | awk '{print $1 }' | xargs -I {} docker rm -f {}  

images="" 
docker images >$images

if [ $image == "serf-dnsmasq" ]
then
	docker_rmi hadoop-master
	docker_rmi hadoop-slave
	docker_rmi hadoop-base
	docker_rmi cloudatl-client 
	docker_rmi cloudatl-server
	docker_rmi serf-dnsmasq
	docker_build serf-dnsmasq
	docker_rmi cloudatl-client 
	docker_rmi cloudatl-server
	docker_build hadoop-base
	docker_build hadoop-master
	docker_build hadoop-slave 
elif [ $image == "hadoop-base" ]
then
	docker_rmi hadoop-master
	docker_rmi hadoop-slave
	docker_rmi hadoop-base
	docker_build hadoop-base
	docker_build hadoop-master
	docker_build hadoop-slave
elif [ $image == "hadoop-master" ]
then
	docker_rmi hadoop-master
	docker_build hadoop-master
elif [ $image == "cloudatl-client" ]
then
	docker_rmi cloudatl-client
	docker_build cloudatl-client
elif [ $image == "cloudatl-server" ]
then
	docker_rmi cloudatl-server
	docker_build cloudatl-server
elif [ $image == "hadoop-slave" ]
then
	docker_rmi hadoop-slave
	docker_build hadoop-slave
else
	echo "The image name is wrong!"
fi

