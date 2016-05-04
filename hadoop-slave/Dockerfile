FROM amineben/hadoop-base:0.2.0

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



CMD '/root/start-ssh-serf.sh'; 'bash'
