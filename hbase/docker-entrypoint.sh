#!/bin/bash
set -e

if [ x$HADOOP_INIT == x"init" ]; then
  echo -e "\033[32m hadoop format \033[0m"
  hadoop namenode -format
fi

if [ x$HBASE_NODE_TYPE = x"mastinier" ]; then
  echo -e "\033[32m hbase master start \033[0m"
  $HBASE_HOME/bin/hbase master start
elif [ x$HBASE_NODE_TYPE = x"region" ]; then
  echo -e "\033[32m hbase region start \033[0m"
  $HBASE_HOME/bin/hbase regionserver start
fi
