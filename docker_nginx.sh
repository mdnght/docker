#/bin/bash
#Docker 部署nginx
#By author Baif


docker run -d -p 8081:80 --name nginx-web-test -v $PWD/nginx/www:/usr/share/nginx/html -v $PWD/nginx/conf/nginx.conf:/etc/nginx/nginx.conf -v $PWD/nginx/logs:/var/log/nginx nginx
