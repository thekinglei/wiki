二进制安装mysql时的坑：
二进制安装后，由于mysql程序存放位置不是默认位置，注意！！！     
需要在/etc/my.cnf中进行定义basedir，不能在启动脚本中定义，否则可能导致异常

我见到过的异常：当my.cnf中配置了

[mysqld]  
character-set-server = utf8mb4  
collation-server = utf8mb4_general_ci  #必须与第一条同时出现，否则出现如下报错

Starting MySQL.... ERROR! The server quit without updating PID file (/data/mysqldata/mysql-mongo.pid).

