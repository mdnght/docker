FROM registry.cn-beijing.aliyuncs.com/acc-pay/centos:v1.0
RUN \
     /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
     echo 'Asia/Shanghai' >/etc/timezone
RUN \
    yum install -y wget curl unzip && \
    yum clean all && \
    curl -sSL http://tool.yingu.com/Fonts/install.sh | sh -
RUN \
    /usr/sbin/useradd tomcat && \
    mkdir -p /data/logs && \
    chown -R tomcat.tomcat /data/* && \
    mkdir /code && \
    mkdir -p /data/config
COPY . /home/tomcat/
RUN \
    chown -R tomcat.tomcat /home/tomcat/* && \
    chmod +x /home/tomcat/run.sh
WORKDIR /code
# ENTRYPOINT su - tomcat -c '/home/tomcat/run.sh system-pay pre'
