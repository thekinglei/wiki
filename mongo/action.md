1、查看信息
use admin
db.auth('user','password')
#查看roles
show roles

#查看用户
show users

#查看数据库
show dbs

#查看tables
show tables

#查看表
show connections


1.1)创建超级权限(所有的操作权限)role：kingstardiroles
use admin
db.auth('root','password')
db.createRole({role:"kingstardiroles",roles:[],privileges:[{resource:{anyResource:true},actions:['anyAction']}]})


1.2)创建超级用户：wl

db.createUser({'user':'wl',pwd:'password',roles:["kingstardiroles"]})



2、日志截断
mongo>db.runCommand({logRotate:1})

/opt/mongodb-linux-x86_64-rhel70-3.4.5/bin/mongo --username wl --password "password" admin  --eval "printjson(db.runCommand({logRotate:1}))"


3、mongo数据备份
ssh root@1.1.1.1 "/opt/mongodbclient/bin/mongodump -h 1.1.1.1 --username wl --password "password" -o /var/backup/mongo/mongodatabackup"

4、删除数据库:删除数据库test
use admin
db.auth('user','password')
use teset
db.dropDatabase()
