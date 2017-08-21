使用supervisor 管理、监控进程


1、安装：
ubuntu下：

apt-get install supervisor

centos:

yum install supervisor

在ubuntu下安装后，自动启动，启动文件：   /etc/init.d/supervisor

centos下没有启动文件，清手动处理或者写一个启动文件


2、配置
安装后，默认有/etc/supervisor/supervisord.conf
cat /etc/supervisor/supervisord.conf

发现：
[include]
files = /etc/supervisor/conf.d/*.conf

或者：
[include]
files = /etc/supervisor/conf.d/*.ini

1）每添加一个监控
比如一个脚本
/root/test.sh
#!/bin/bash
for i in {1..10}
do
    echo "$i"
    sleep $i
    now_time=$(date +"%Y-%m-%d %H-%M-%S")
    echo $now_time >> /root/wl_test.txt
    echo $i >> /root/wl_test.txt
    echo "---------" >>/root/wl_test.txt
done


2）添加到supervisor管理

touch /etc/supervisor/conf.d/test.ini

vim test.ini

注意：test.ini格式，标头[program:test],以[key:value]的形式确定程序名称，command是启动命令

------------------内容如下-----------------------

[program:test]
command = /root/test.sh
auto_start = true
autorestart = true
username=root

-----------------------------------------

3）重启supervisor，（此操作为ubuntu，centos略有区别）

/etc/init.d/supervisor restart || supervisctl restart ||supervisctl reload

4）启动test
supervisorctl start test



注意事项：
对于托管服务来说，自身不能是后台执行，即supervisor 监控的进程必须以非daemon 方式运行；
举例：
1)启动脚本不能写成 nohup  java -jar test.jar &  ,而是 exec java -jar test.jar &

2)对于mongo来说 启动命令为 mongod -f /etc/mongodb.conf ,注意配置文件mongodb.conf中配置项：【后台运行：fork=true】要注释掉；

可以参考官网，mysql（会涉及启动子进程）的托管方法

http://supervisord.org/subprocess.html


3)supervisord 托管apache服务

#cat /etc/supervisor/conf.d/apache.conf

[program:apache]
command = /root/apache-tomcat-8.5.11/bin/catalina.sh run
auto_start = true
autorestart = true
username=root




