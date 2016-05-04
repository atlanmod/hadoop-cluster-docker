#!/bin/bash
echo -e "\nStoping HBase"
$HBASE_INSTALL/bin/stop-hbase.sh
echo -e  "\nStoping jobHistory Server"
$HADOOP_INSTALL/sbin/mr-jobhistory-daemon.sh stop historyserver
echo -e "\nStoping yarn"
$HADOOP_INSTALL/sbin/stop-yarn.sh
echo -e "\nStoping hdfs"
$HADOOP_INSTALL/sbin/stop-dfs.sh
