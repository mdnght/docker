#/bin/bash
#Docker 部署nginx
#By author Baif

Nginx_HOME=/data/local/nginx
Nginx_Conf=/data/local/nginx/conf/nginx.conf
Nginx_Logs=/data/logs/nginx
Nginx_Dockername=Nginx-web
Nginx_Port=80

function install_docker() {
  #docker 安装
  yum -y update
  yum -y install python-devel
  yum -y install docker-io
  service docker start
}

if [[ ! -d ${Nginx_HOME} ]] ; then
  mkdir -p ${Nginx_HOME}
fi

if [[ ! -d ${Nginx_Logs} ]] ; then
  mkdir -p ${Nginx_Logs}  
fi

install_docker

docker run -d -p ${Nginx_Port}:80 --name ${Nginx_Dockername} -v ${Nginx_Conf}:/etc/nginx/nginx.conf -v ${Nginx_Logs}:/var/log/nginx nginx

