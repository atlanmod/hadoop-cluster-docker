FROM amineben/hadoop-base

MAINTAINER Amine BENELALLAM <amine.benelallam@inria.fr>

# move all configuration files into container
ADD files/* /tmp/
ADD files/dist /root/dist
 
ENV HADOOP_INSTALL /usr/local/hadoop
ENV HBASE_INSTALL /usr/local/hbase

RUN mkdir -p ~/hdfs/namenode && \ 
mkdir -p ~/hdfs/datanode && \
mkdir $HADOOP_INSTALL/logs

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

RUN chmod +x ~/start-hadoop.sh && \
chmod +x ~/stop-hadoop.sh && \
chmod +x ~/run-wordcount.sh && \
chmod +x ~/start-ssh-serf.sh && \
chmod +x ~/dist/dist-gen/run.sh && \
chmod +x ~/dist/dist-trans/run.sh && \
chmod 1777 tmp

# format namenode
RUN /usr/local/hadoop/bin/hdfs namenode -format

EXPOSE 22 7373 7946 9000 50010 50020 50070 50075 50090 50475 8025 8030 8031 8032 8033 8034 8040  8042 8060 8080 8088 50060 60010 60030 8085 2181 60000 60020

CMD '/root/start-ssh-serf.sh'; 'bash'
