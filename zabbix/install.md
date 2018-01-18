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

如果zabbix-agent与server不匹配，则通过rpm引入源

例如：参考官网：https://www.zabbix.com/documentation/3.2/manual/installation/install_from_packages/repository_installation

rpm -ivh http://repo.zabbix.com/zabbix/3.2/rhel/7/x86_64/zabbix-release-3.2-1.el7.noarch.rpm

yum install zabbix-agent（yum reinstall zabbix-agent）


注意：
centos下配置文件包括/etc/zabbix/zabbix_agent.conf 和/etc/zabbix/zabbix_agentd.conf
有效的配置文件是/etc/zabbix/zabbix_agentd.conf
StartAgents=3 #启动的agents个数为3



安装zabbix-agent，注意要与server版本匹配，可上官网进行查看  
centos上安装zabbix简单方法  
rpm -ivh http://repo.zabbix.com/zabbix/3.2/rhel/6/x86_64/zabbix-agent-3.2.0-1.el6.x86_64.rpm
