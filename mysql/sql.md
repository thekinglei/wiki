shell脚本中操作mysql
示例如下：

test.sh

#!/bin/bash
set -e
host="192.168.1.1"
user="root"
password="111111"
database_name="test"
mysql="/usr/local/mysql/bin/mysql"

$mysql -h $host -u $user -p"$password"<<EOF
show databases;
drop database wl2;
create databases $database_name;
show databases;
EOF
的

将mysql变量打印  
mysql -u xxxxx -p xxxxx -B -e 'show variables' 可以输出MySQL所有的变量


mysql备份：  
mysqldump -h mysql.server.com -uroot -ptest dbname > backup.sql

此命令导出后，backup.sql中的insert 语句没有列名，而是直接 insert values ()

解决方法：mysqldump -h mysql.server.com -uroot -ptest -c dbname > backup.sql  
加上-c 生成的backup.sql 的insert 语句 会是 insert (column1,column2, ……) values (value1,value2,……)
