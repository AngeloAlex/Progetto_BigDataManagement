#!/bin/bash 


rm -r $HADOOP_DIR/output
$HADOOP_DIR/bin/hdfs dfsadmin -safemode leave
$HADOOP_DIR/bin/hdfs dfs -rm -r output
$HADOOP_DIR/bin/hdfs dfs -rm -r input

$HADOOP_DIR/bin/hdfs dfs -put $HADOOP_DIR/app-input input
$HADOOP_DIR/bin/hadoop jar $HADOOP_DIR/app-cammarota.jar bigdataman.cammarota.stroke.App input output
$HADOOP_DIR/bin/hdfs dfs -get output $HADOOP_DIR/output
cat $HADOOP_DIR/output/*
