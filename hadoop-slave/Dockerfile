FROM amineben/hadoop-base

MAINTAINER Amine BENELALLAM <amine.benelallam@inria.fr>


# move all confugration /tmp into container
ADD files/* /tmp/


ENV HADOOP_INSTALL /usr/local/hadoop
ENV HBASE_CONF /usr/local/hbase/conf
RUN mkdir $HADOOP_INSTALL/logs

RUN mv /tmp/hdfs-site.xml $HADOOP_INSTALL/etc/hadoop/hdfs-site.xml && \
mv /tmp/core-site.xml $HADOOP_INSTALL/etc/hadoop/core-site.xml && \
mv /tmp/mapred-site.xml $HADOOP_INSTALL/etc/hadoop/mapred-site.xml && \
mv /tmp/yarn-site.xml $HADOOP_INSTALL/etc/hadoop/yarn-site.xml && \
mv /tmp/log4j.properties $HADOOP_INSTALL/etc/hadoop/log4j.properties && \
mv /tmp/hbase-site.xml $HBASE_CONF/hbase-site.xml && \
mv /tmp/regionservers $HBASE_CONF/regionservers && \
mv /tmp/start-ssh-serf.sh ~/start-ssh-serf.sh && \
chmod +x ~/start-ssh-serf.sh

EXPOSE 22 7373 7946 9000 50010 50020 50070 50075 50090 50475 8025 8030 8031 8032 8033 8040 8034 8042 8060 8080 8088 50060 60010 60030 8085 2181 60000 60020

CMD '/root/start-ssh-serf.sh'; 'bash'
