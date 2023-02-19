FROM centos

RUN rm -rf /etc/yum.repos.d/CentOS-*
ADD conf/Centos-8.repo /etc/yum.repos.d/CentOS-Base.repo
RUN yum clean all && yum makecache

RUN yum install -y openssh-server sudo
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
RUN yum  install -y openssh-clients net-tools

RUN echo "root:qwe123" | chpasswd
RUN echo "root   ALL=(ALL)       ALL" >> /etc/sudoers
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key

RUN mkdir /var/run/sshd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

