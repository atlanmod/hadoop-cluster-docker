FROM kiwenlau/serf-dnsmasq:0.1.0

MAINTAINER Amine BENELALLAM <amine.benelallam@inria.fr>

# install openssh-server, vim, lsof and openjdk
RUN apt-get update --fix-missing
RUN apt-get install -y openssh-server vim
RUN apt-get install -y openjdk-7-jdk


# download hbase
RUN wget https://archive.apache.org/dist/hbase/0.98.13/hbase-0.98.13-hadoop2-bin.tar.gz &&\
tar -xf hbase-0.98.13-hadoop2-bin.tar.gz -C /usr/local &&\
rm  hbase-0.98.13-hadoop2-bin.tar.gz


# download hadoop 
RUN wget http://www.eu.apache.org/dist/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz &&\
tar -xf hadoop-2.6.0.tar.gz -C /usr/local/ &&\
rm hadoop-2.6.0.tar.gz

# download native library
RUN mkdir -p /tmp/native
RUN curl -Ls http://dl.bintray.com/sequenceiq/sequenceiq-bin/hadoop-native-64-2.6.0.tar | tar -x -C /tmp/native

# set java environment variable 
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64 
ENV PATH $PATH:$JAVA_HOME/bin

#configure ssh free key access
RUN mkdir /var/run/sshd && \
ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
mv /usr/local/ssh_config ~/.ssh/config && \
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Fixing ssh config
RUN sed  -i "/^[^#]*UsePAM/ s/.*/#&/"  /etc/ssh/sshd_config
RUN echo "UsePAM no" >> /etc/ssh/sshd_config
RUN echo "Port 2122" >> /etc/ssh/sshd_config


#install hadoop 2.6.0/hbase
RUN ln -s /usr/local/hadoop-2.6.0 /usr/local/hadoop && \
ln -s /usr/local/hbase-0.98.13-hadoop2 /usr/local/hbase && \
rm -rf /usr/local/hadoop/lib/native && \

# adding configuration files
ADD files/* /usr/local/

RUN mv /tmp/native /usr/local/hadoop/lib && \
mv /usr/local/bashrc ~/.bashrc && \
mv /usr/local/hadoop-env.sh /usr/local/hadoop/etc/hadoop/hadoop-env.sh &&\
mv /usr/local/hbase-env.sh /usr/local/hbase/conf/hbase-env.sh





##exposing Hadoop & hbase ports
EXPOSE 22 7373 7946 9000 50010 50020 50070 50075 50090 50475 8025 8030 8031 8032 8033 8040 8034 8042 8060 8080 8088 50060 60010 60030 8085 2181 60000 60020 19888
