#!/bin/bash

# the script takes two arguments (order should be respected !!!)
image=$1
tag=0.2.0

if [ $# < 2 ]
then
	echo "Please use image name and a tag as the arguments. Note that the order should be respected !"
	exit 1
fi


# founctions for delete images
function docker_rmi_original()
{
	echo -e "\n\nsudo docker rmi kiwenlau/$1:0.1.0"
	sudo docker rmi -f kiwenlau/$1:$tag
}

function docker_rmi()
{
	echo -e "\n\nsudo docker rmi amineben/$1:$tag"
	sudo docker rmi -f amineben/$1:$tag
}

# founctions for build images
function docker_build_original()
{
	cd $1
	echo -e "\n\nsudo docker build -t kiwenlau/$1:0.1.0 ."
	/usr/bin/time -f "real  %e" sudo docker build -t kiwenlau/$1:0.1.0 .
	cd ..
}

function docker_build()
{
	cd $1
	echo -e "\n\nsudo docker build -t amineben/$1:$tag ."
	/usr/bin/time -f "real  %e" sudo docker build -t amineben/$1:$tag .
	cd ..
}


echo -e "\ndocker rm -f slave1 slave2 master"
sudo docker rm -f slave1 slave2 master

sudo docker images >images.txt

if [ $image == "serf-dnsmasq" ]
then
	docker_rmi hadoop-master
	docker_rmi hadoop-slave
	docker_rmi hadoop-base
	docker_rmi_original serf-dnsmasq
	docker_build_original serf-dnsmasq
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
elif [ $image == "hadoop-slave" ]
then
	docker_rmi hadoop-slave
	docker_build hadoop-slave
else
	echo "The image name is wrong!"
fi

echo -e "\nimages before build"
cat images.txt
rm images.txt

echo -e "\nimages after build"
sudo docker images
