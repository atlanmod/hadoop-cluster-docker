#!/bin/bash
echo -e "\nStarting hdfs"
$HADOOP_INSTALL/sbin/start-dfs.sh

echo -e echo -e "\nStarting yarn"
$HADOOP_INSTALL/sbin/start-yarn.sh

echo -e  "\nStarting jobHistory Server"
$HADOOP_INSTALL/sbin/mr-jobhistory-daemon.sh start historyserver

echo -e "\nStarting HBase"
$HBASE_INSTALL/bin/start-hbase.sh
