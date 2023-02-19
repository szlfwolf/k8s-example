FROM centos8-ssh

# jdk
ADD ./package/jdk-8u202-linux-x64.tar.gz /usr/local/
RUN mv /usr/local/jdk1.8.0_202 /usr/local/jdk1.8
ENV JAVA_HOME /usr/local/jdk1.8

# hadoop
ADD ./package/hadoop-3.2.3.tar.gz /usr/local/
ENV HADOOP_HOME=/usr/local/hadoop-3.2.3

# hbase
ADD ./package/hbase-2.4.15-bin.tar.gz /usr/local/
ENV HBASE_HOME=/opt/hbase

ENV PATH=$JAVA_HOME/bin:$HADOOP_HOME/bin:HBASE_HOME/bin:$PATH


# opentsdb
ENV OPENTSDB_RPM_URL=https://github.com/OpenTSDB/opentsdb/releases/download/v2.4.1/opentsdb-2.4.1-1-20210902183110-root.noarch.rpm
ENV OPENTSDB_HOME=/opt/opentsdb
ADD ./package/opentsdb-2.4.1.rpm ${OPENTSDB_HOME}/install.rpm
RUN yum localinstall -y ${OPENTSDB_HOME}/install.rpm
