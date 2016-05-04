# Credits
Scripts adapted from  [kiwenlau/hadoop-cluster-docker](https://github.com/kiwenlau/hadoop-cluster-docker). 
Informations about how to use this repository will be provided soon.

# Organization 
This project keeps the same organization in the original one, excepting for the the **hadoop-base** image that is extended with hbase in addition to hadoop. 

# Content and description 
The repository contains 4 docker images. 
While no changes have been made on the original serf-dnsmasq, hadoop-base was extended to enable the build of an image containing **hadoop-2.6.0** and **hbase-0.98.13**. 
Further changes that have been carried out relate to the **hadoop-(master|slave)** images. In particular, hbase related configuration files have been added, and respective ports have been exposed.

# How to use
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


**N.B**: This fork contains data related to an experiment.
