通过shell脚本dump mysql表

示例如下：将数据库test中表test的导出到/home/mysql/company.dic 中

#!/bin/bash
set -e
source /etc/profile
host="172.17.1.1"
user="root"
password="111111"
database_name="test"
mysql=$(which mysql)
DATAPATH="/home/mysql"

[[ -f "${DATAPATH}/company.dic" ]] && { rm -f "${DATAPATH}/company.dic"; }
$mysql -h $host -u $user -p"$password"<<EOF
use $database_name;
select companyname from test limit 10 into outfile "${DATAPATH}/company.dic";
EOF
