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
