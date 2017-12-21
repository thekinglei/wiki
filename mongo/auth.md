mongo设置账号密码：

1、修改/etc/mongo.conf  ,auth=true,如下

#数据库数据存放目录
dbpath=/datas/mongodb
#数据库日志存放目录
logpath=/datas/mongodb/logs/mongodb.log 
#以追加的方式记录日志
logappend = true
#端口号 默认为27017
port=27017 
#以后台方式运行进程
fork=true 
 #开启用户认证
auth=true
#关闭http接口，默认关闭http端口访问
#nohttpinterface=true
#mongodb所绑定的ip地址
#bind_ip = 127.0.0.1 
#启用日志文件，默认启用
journal=true 


2、重启mongo ，./mongod -f /etc/mongo.conf


3、登录mongo,初次登录，切换admin，并设置admin级别用户（root）账号密码
#mongo

>use admin  #切换到admin库下

>db.createUser({user:"root",pwd:"password",roles:["userAdminAnyDatabase"]})   #创建超级用户root和密码

> db.auth("root","password")    #登录认证

>show dbs    #认证通过，查看服务器下的所有库

>use mydb    #切换到db ： mydb，并创建用户名为me的用户，授予读写权限

>db.createUser({user:"me",pwd:"me-password",roles:["readWrite"]})

>db.updateUser('test',{pwd:"test"})  

总结：  
1）切换到admin库，并创建超级用户  
2）切换到对应的库：use database_name，并设置新的账号密码，及对应权限  
3）查看账号：show users  
4）认证登录：db.auth('user_name','password')

补充说明：  
admin的超级账户只是有操作各种账号授权管理的权限，不具有具体库的操作权限，因此，如果涉及到数据库恢复的问题，必须创建一个超级账号并设置可备份、恢复等操作权限，参考http://blog.csdn.net/u011191463/article/details/68485529

示例如下  
mongoexport导出.dat的文件恢复  
#mongoimport -u username -p "password" --authenticationDatabase admin -d wltest -c wltable -o ./wltable.dat  
mongodump导出的目录恢复  
#mongorestore -u username -p "password" --authenticationDatabase admin -d wltest -c wltable ./wltable.bson  



