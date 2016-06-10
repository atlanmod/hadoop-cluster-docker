# Credits
Scripts adapted from  [kiwenlau/hadoop-cluster-docker](https://github.com/kiwenlau/hadoop-cluster-docker). 
Informations about how to use this repository will be provided soon.

# Organization 
This project keeps the same organization as in the original one, excepting for the  **hadoop-base** image that is extended with hbase installation in addition to hadoop. 

# Content and description 
The repository contains 4 docker images. 
While no changes have been made on the original serf-dnsmasq, hadoop-base was extended to enable the build of an image containing **hadoop-2.6.0** and **hbase-0.98.13**. 
Further changes that have been carried out relate to the **hadoop-(master|slave)** images. In particular, hbase related configuration files have been added, and respective ports have been exposed.

# How to use

##Prerequisites
1. [Docker](https://www.docker.com/)
2. [Git](https://git-scm.com/)
3. [Git lfs](https://git-lfs.github.com/)

## Building the images

By default, the configuration files provided in this repository enable the deployment of a cluster having 1 **master** and up to 8 **slave** containers. Steps on how to resize the cluster are described below.
The bash scipt **build-image.sh** is responsible for building the docker images. It takes as argument the image name {hadoop-(base|slave|master)}.
In order to build all the images involved in the deployment of the cluster, **hadoop-base** should be provided in argument which triggers  the build of **hadoop-(slave|master)** as they are built on top of **hadoop-base**.


```
./build-image.sh hadoop-base
```

The script enables also building **hadoop-(slave|master)**.
```
./build-image.sh hadoop-master
./build-image.sh hadoop-slave
```


## Deploying the cluster

The bash script **start-container.sh** is responsible for deploying the cluster. 
It takes as argument  the number of containers **n** to be launched **(1 master & n-1 slaves)**. If no argument is provided, the script generates a cluster of size 3. Note that the argument value should not be greater than the cluster size (9 by default). 

```
./start-container.sh n
```
The script is also responsible for launching  hadoop and hbase related daemons. Please give it some to set everything up.
In order to make sure that both hadoop and hbase  are up and running. First, inspect the address of the **master** container by executing the following docker command:

```
docker inspect --format="{{.NetworkSettings.IPAddress}}" master
```

Then, go to you internet browser and type the IP address resulting from the previous command appended with ':8088' for mapreduce and ':60010' for hbase. Both pages should show all the available slaves.  

## Resizing the cluster 

As mentionned earlier, 9 is the default cluster size. If one wishes to generate new configuration files for hadoop and hbase, the script **resize-cluster.sh**  is there for this. 
It takes as argument an integer **n** that represents the size of the cluster **(1 master & n-1 slaves)**.
in order for the changes to be propagated in the docker images, you should rebuild hadoop-(master|slave).

```
./resize-cluster.sh n
```

#Using the cluster in [AWS](https://console.aws.amazon.com)

As a proof of concept we tested our deployment in in a AWS instance of type r3.4xlarge type.		 +As a proof of concept we tested our deployment in 
In order to ease the installation of Docker, it is recommended to choose Linux as OS.		
Hereafter, we will walk you through the AWS instance confiuration and the cluster deployment.	

## Making the EBS Volume available for use in Linux

Once your ec2 instance is launched, only the principal partition with limited size is available for use.
An unallocated EBS volume is there waiting for your intervention to partition it according to your need.
This volume is exposed as a block device. You can format it with any file system and then mount it.
After you make the EBS volume available for use, you can access it in the same ways that you access any other volume.
We recommend you to use the principal partition to install packages, and the EBS one to deploy the cluster.
Instructions on how to format and mount an EBS volume can be found in this [link](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html).
## Installing docker		
 		
 1. To install docker please follow the instructions provided in the official [documentation](https://docs.docker.com/engine/installation/linux/ubuntulinux/).		
 2. Change imge installation directopry to point to the directory you just mounted as illustrated in this [forum](https://forums.docker.com/t/how-do-i-change-the-docker-image-installation-directory/1169).		
  
## Installing Git and Git lfs		
 		
 1. Instrction on how to install git can be found in this [link](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).		
 2. Instruction on how to install git lfs can be found [here](https://git-lfs.github.com/).		
 		
 

**N.B**: This fork contains data related to an experiment.
