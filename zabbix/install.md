1、安装zabbix
通过容器安装
在192.168.1.1服务器上安装zabbix-server和zabbix-web
#!/bin/bash
docker run --net=host --name zabbix-server-test -e DB_SERVER_HOST="192.168.1.1" -e MYSQL_USER="root" -e MYSQL_PASSWORD="mysql_passwd" -e ZBX_SERVER_HOST="localhost" -e PHP_TZ="Asia/Shanghai" -d zabbix/zabbix-server-mysql:latest

部署zabbix-web容器
docker run --name zabbix-web -e DB_SERVER_HOST="192.168.1.1" -e MYSQL_USER="mysql_user" -e MYSQL_PASSWORD="mysql_passwd" -e ZBX_SERVER_HOST="192.168.3.1" -e PHP_TZ="Asia/Shanghai" -p 80:80 -d zabbix/zabbix-web-nginx-mysql:latest

登录zabbix：
浏览器输入：192.168.1.1
账号：Admin
密码：zabbix

2、安装zabbix-agent：
ubuntu：
apt-get install zabbix-agent

centos:
yum install zabbix-agent

配置zabbix-agent：
vim /etc/zabbix/zabbix_agentd.conf，改为zabbix-server地址，注意不能是127.0.0.1，必须是真实IP
Server=192.168.1.1
ServerActive=192.168.1.1


注意：
centos下配置文件包括/etc/zabbix/zabbix_agent.conf 和/etc/zabbix/zabbix_agentd.conf
有效的配置文件是/etc/zabbix/zabbix_agentd.conf
StartAgents=3 #启动的agents个数为3
