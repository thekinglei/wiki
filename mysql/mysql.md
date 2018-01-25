二进制安装mysql时的坑：
二进制安装后，由于mysql程序存放位置不是默认位置，注意！！！     
需要在/etc/my.cnf中进行定义basedir，不能在启动脚本中定义，否则可能导致异常

我见到过的异常：当my.cnf中配置了

[mysqld]  
character-set-server = utf8mb4  
collation-server = utf8mb4_general_ci  #必须与第一条同时出现，否则出现如下报错

Starting MySQL.... ERROR! The server quit without updating PID file (/data/mysqldata/mysql-mongo.pid).


mysql无法grant时（以root账号执行grant）  
将my.cnf配置skip-grant-tables，然后重启mysql   
然后以无密码登录后，执行：grant all privileges on *.* to username@'%' …………时，报错如下：  
ERROR 1290 (HY000): The MySQL server is running with the --skip-grant-tables option so it cannot execute this statement  

此时，执行flush privileges ，在执行grant即可
注：如果现实授权添加失败，可以先glush privileges；再执行grant也能成功；


