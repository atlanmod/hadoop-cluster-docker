FROM kiwenlau/serf-dnsmasq:0.1.0

MAINTAINER KiwenLau <kiwenlau@gmail.com>

# install openssh-server, vim, lsof and openjdk
RUN apt-get update --fix-missing
RUN apt-get install -y openssh-server vim
RUN apt-get install -y openjdk-7-jdk
RUN apt-get install -y lsof

# move all configuration files into container
ADD files/hadoop-2.6.0 /usr/local/hadoop-2.6.0  
ADD files/hbase-0.98.13-hadoop2 /usr/local/hbase-0.98.13-hadoop2
ADD files/* /usr/local/

# display the content of /usr/local
RUN ls -la /usr/local/

# set java environment variable 
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64 
ENV PATH $PATH:$JAVA_HOME/bin

#configure ssh free key access
RUN mkdir /var/run/sshd && \
ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
mv /usr/local/ssh_config ~/.ssh/config && \
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

#install hadoop 2.6.0/hbase
RUN ln -s /usr/local/hadoop-2.6.0 /usr/local/hadoop && \
ln -s /usr/local/hbase-0.98.13-hadoop2 /usr/local/hbase && \
#ln -s /usr/local/hadoop-2.6.0/etc/hadoop/hdfs-site.xml /usr/local/hbase-0.98.13-hadoop2/conf/ && \
mv /usr/local/bashrc ~/.bashrc && \
mv /usr/local/hadoop-env.sh /usr/local/hadoop/etc/hadoop/hadoop-env.sh &&\
mv /usr/local/hbase-env.sh /usr/local/hbase/conf/hbase-env.sh
