FROM amineben/hadoop-base:0.2.0

MAINTAINER Amine BENELALLAM <amine.benelallam@inria.fr>

# Install zip and sendemail packages
#RUN apt-get --assume-yes install zip 
#RUN apt-get --assume-yes install install libio-socket-ssl-perl libnet-ssleay-perl sendemail
# move all configuration files into container
ADD files/* /tmp/
ADD files/dist /root/dist

RUN ls -la --color /tmp/ && ls -la --color /usr/local/hbase/
ENV HADOOP_INSTALL /usr/local/hadoop
ENV HBASE_INSTALL /usr/local/hbase

RUN mkdir -p ~/hdfs/namenode && \ 
mkdir -p ~/hdfs/datanode && \
mkdir $HADOOP_INSTALL/logs

RUN echo "alias ls='ls -la --color'" >> ~/.bashrc &&\ 
echo "alias cls='`printf '\033c'`'" >> ~/.bashrc

RUN mv /tmp/hdfs-site.xml $HADOOP_INSTALL/etc/hadoop/hdfs-site.xml && \ 
mv /tmp/core-site.xml $HADOOP_INSTALL/etc/hadoop/core-site.xml && \
mv /tmp/mapred-site.xml $HADOOP_INSTALL/etc/hadoop/mapred-site.xml && \
mv /tmp/yarn-site.xml $HADOOP_INSTALL/etc/hadoop/yarn-site.xml && \
mv /tmp/log4j.properties $HADOOP_INSTALL/etc/hadoop/log4j.properties && \
mv /tmp/slaves $HADOOP_INSTALL/etc/hadoop/slaves && \
mv /tmp/hbase-site.xml $HBASE_INSTALL/conf/hbase-site.xml && \ 
mv /tmp/regionservers $HBASE_INSTALL/conf/regionservers && \
mv /tmp/start-hadoop.sh ~/start-hadoop.sh && \
mv /tmp/stop-hadoop.sh ~/stop-hadoop.sh && \
mv /tmp/run-wordcount.sh ~/run-wordcount.sh && \ 
mv /tmp/start-ssh-serf.sh ~/start-ssh-serf.sh

#create a symlink to libs 
RUN ln -s ~/dist/dist-trans/libs ~/dist/dist-gen/libs

#chmod bash files 
RUN chmod +x ~/*.sh && \
chmod +x ~/dist/dist-gen/run.sh && \
chmod +x ~/dist/dist-trans/*.sh && \
chmod +x ~/dist/dist-trans/experiments-data/*.sh && \
chmod 1777 tmp &&\
mkdir /usr/local/hbase/zookeeper

# format namenode
RUN /usr/local/hadoop/bin/hdfs namenode -format

CMD '/root/start-ssh-serf.sh'; 'bash'
