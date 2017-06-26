#!/bin/bash
#说明：
#先通过此镜像创建一个新的容器(docker run --name test -d httpd:latest)
#将配置文件拷出来:docker cp test:/usr/local/apache2/conf /opt/httpd/conf
#再如下启动即可
#此时可以配置httpd服务器配置，和配置目标文件目录htdocs
#将需要浏览器下载的文件存储到虚拟机的/opt/httpd/htdocs目录下
docker run -v /opt/httpd/conf:/usr/local/apache2/conf \
           -v /opt/httpd/htdocs:/usr/local/apache2/htdocs -p 80:80 \
           --name apache-app -d httpd:latest
