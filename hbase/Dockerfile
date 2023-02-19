FROM centos

RUN rm -rf /etc/yum.repos.d/CentOS-*
ADD conf/Centos-8.repo /etc/yum.repos.d/CentOS-Base.repo
RUN yum clean all && yum makecache
RUN yum install -y openssh-server sudo net-tools
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
RUN yum install -y openssh-clients

ARG SSH_PUB='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDlHCY4sinkyLaJvLL+I5u8xdsL8+F6ZCymga+0s4xXFxOlhvG94c9CGAKbi/c63818Ds7J9XOkCuvAdpD2b8dFcLrCMKBzfWSPNbAj5uX/KjPSXPA3p/n6S2ZbYa4+NIefS2xhu1PgkNvQ/bLVCgrOXnW70wIu+ZFpA04QfB616Kg6FW05AfNcFhe7pwu8+6obegAzV7m4kO+dB7cp4xY7xm2ku5MFHEYRyrZF5ZoWwczRDlBrTzOLlLf9T7mbUp40eFJWXB2/igXmrsTILUUDh0xnj0G0qVBm86ta3QEA1W3eRd0GwM2OyExYtgaziPvRM/gsfEomfO4H0qzIa248+M+5ZEACCHnPa1oWrd499zwQfV+d4ZLRhZX8PqHO9pdH4DWKVM0SUiQYymHSLWYEnSHV2vF6cw49V+66/MNdX10XBQAqB18qKyAdemyPZn0BRWbUV/zkM4mVH+KxZS7ve33pgAuTYdsZf3BQo7JeF1eUH3dOi3boh7aS1d5MGvk= szlfw@dell-g15'
RUN sed -i -r 's/^\s*UseDNS\s+\w+/#\0/; s/^\s*PasswordAuthentication\s+\w+/#\0/; s/^\s*ClientAliveInterval\s+\w+/#\0/' /etc/ssh/sshd_config;
RUN echo 'UseDNS no \nPermitRootLogin yes \nPasswordAuthentication yes \nClientAliveInterval 30' >> /etc/ssh/sshd_config;
RUN su root bash -c 'cd;mkdir .ssh;chmod 700 .ssh;echo ${SSH_PUB} > .ssh/authorized_keys;chmod 644 .ssh/authorized_keys'
RUN su root bash -c 'cd;ssh-keygen -t rsa -f ~/.ssh/id_rsa; cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys'

# hadoop
ENV HADOOP_VERSION=3.2.3
ENV HADOOP_TGZ_URL=https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
ENV HADOOP_HOME=/opt/hadoop
ENV PATH=$HADOOP_HOME/bin:$PATH
ADD ./package/hadoop-3.2.3.tar.gz $HADOOP_HOME/

# clean trash file or dir
# RUN find $HADOOP_HOME/ -maxdepth 1 -not -name 'lib' ! -path $HADOOP_HOME/ -exec rm -rf {} \;

# hbase
ENV HBASE_VERSION=2.4.15
ENV HBASE_TGZ_URL=https://mirrors.tuna.tsinghua.edu.cn/apache/hbase/stable/hbase-$HBASE_VERSION-bin.tar.gz
ENV HBASE_HOME=/opt/hbase
ENV PATH=$HBASE_HOME/bin:$PATH
ADD ./package/hbase-2.4.15-bin.tar.gz $HBASE_HOME/

# opentsdb
ENV OPENTSDB_RPM_URL=https://github.com/OpenTSDB/opentsdb/releases/download/v2.4.1/opentsdb-2.4.1-1-20210902183110-root.noarch.rpm
ENV OPENTSDB_HOME=/opt/opentsdb
ADD ./package/opentsdb-2.4.1.rpm ${OPENTSDB_HOME}/install.rpm


# COPY docker-entrypoint.sh /
# ENTRYPOINT [ "/docker-entrypoint.sh" ]

# RUN mkdir /var/run/sshd
# EXPOSE 22 9870 9000
# CMD ['/usr/sbin/sshd',"-D"]