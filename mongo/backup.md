mongodb数据备份和还原主要分为二种，一种是针对于库的mongodump和mongorestore，一种是针对库中表的mongoexport和mongoimport。
一，mongodump备份数据库
1，常用命令格
mongodump -h IP --port 端口 -u 用户名 -p 密码 -d 数据库 -o 文件存在路径 
如果没有用户谁，可以去掉-u和-p。
如果导出本机的数据库，可以去掉-h。
如果是默认端口，可以去掉--port。
如果想导出所有数据库，可以去掉-d。
2,导出所有数据库
[root@localhost mongodb]# mongodump -h 127.0.0.1 -o /home/zhangy/mongodb/ 
connected to: 127.0.0.1 
Tue Dec 3 06:15:55.448 all dbs 
Tue Dec 3 06:15:55.449 DATABASE: test   to   /home/zhangy/mongodb/test 
Tue Dec 3 06:15:55.449   test.system.indexes to /home/zhangy/mongodb/test/system.indexes.bson 
Tue Dec 3 06:15:55.450     1 objects 
Tue Dec 3 06:15:55.450   test.posts to /home/zhangy/mongodb/test/posts.bson 
Tue Dec 3 06:15:55.480     0 objects 
 
。。。。。。。。。。。。。。。。。。。。省略。。。。。。。。。。。。。。。。。。。。。。。。。。 

3,导出指定数据库
[root@localhost mongodb]# mongodump -h 192.168.1.108 -d tank -o /home/zhangy/mongodb/ 
connected to: 192.168.1.108 
Tue Dec 3 06:11:41.618 DATABASE: tank   to   /home/zhangy/mongodb/tank 
Tue Dec 3 06:11:41.623   tank.system.indexes to /home/zhangy/mongodb/tank/system.indexes.bson 
Tue Dec 3 06:11:41.623     2 objects 
Tue Dec 3 06:11:41.623   tank.contact to /home/zhangy/mongodb/tank/contact.bson 
Tue Dec 3 06:11:41.669     2 objects 
Tue Dec 3 06:11:41.670   Metadata for tank.contact to /home/zhangy/mongodb/tank/contact.metadata.json 
Tue Dec 3 06:11:41.670   tank.users to /home/zhangy/mongodb/tank/users.bson 
Tue Dec 3 06:11:41.685     2 objects 
Tue Dec 3 06:11:41.685   Metadata for tank.users to /home/zhangy/mongodb/tank/users.metadata.json 

三，mongorestore还原数据库
1,常用命令格式
mongorestore -h IP --port 端口 -u 用户名 -p 密码 -d 数据库 --drop 文件存在路径 
 
--drop的意思是，先删除所有的记录，然后恢复。
2,恢复所有数据库到mongodb中
[root@localhost mongodb]# mongorestore /home/zhangy/mongodb/  #这里的路径是所有库的备份路径 
 
3,还原指定的数据库
[root@localhost mongodb]# mongorestore -d tank /home/zhangy/mongodb/tank/  #tank这个数据库的备份路径 
 
[root@localhost mongodb]# mongorestore -d tank_new /home/zhangy/mongodb/tank/  #将tank还有tank_new数据库中
  
这二个命令，可以实现数据库的备份与还原，文件格式是json和bson的。无法指写到表备份或者还原。
四，mongoexport导出表，或者表中部分字段
1,常用命令格式
mongoexport -h IP --port 端口 -u 用户名 -p 密码 -d 数据库 -c 表名 -f 字段 -q 条件导出 --csv -o 文件名 
上面的参数好理解，重点说一下：
-f    导出指字段，以字号分割，-f name,email,age导出name,email,age这三个字段
-q    可以根查询条件导出，-q '{ "uid" : "100" }' 导出uid为100的数据
--csv 表示导出的文件格式为csv的，这个比较有用，因为大部分的关系型数据库都是支持csv，在这里有共同点
2,导出整张表
[root@localhost mongodb]# mongoexport -d tank -c users -o /home/zhangy/mongodb/tank/users.dat 
connected to: 127.0.0.1 
exported 4 records 

3,导出表中部分字段
[root@localhost mongodb]# mongoexport -d tank -c users --csv -f uid,name,sex -o tank/users.csv 
connected to: 127.0.0.1 
exported 4 records 

4,根据条件敢出数据
[root@localhost mongodb]# mongoexport -d tank -c users -q '{uid:{$gt:1}}' -o tank/users.json 
connected to: 127.0.0.1 
exported 3 records 

五，mongoimport导入表，或者表中部分字段
1,常用命令格式
1.1,还原整表导出的非csv文件
mongoimport -h IP --port 端口 -u 用户名 -p 密码 -d 数据库 -c 表名 --upsert --drop 文件名  
重点说一下--upsert，其他参数上面的命令已有提到，--upsert 插入或者更新现有数据
1.2,还原部分字段的导出文件
mongoimport -h IP --port 端口 -u 用户名 -p 密码 -d 数据库 -c 表名 --upsertFields 字段 --drop 文件名  
--upsertFields根--upsert一样
1.3,还原导出的csv文件
mongoimport -h IP --port 端口 -u 用户名 -p 密码 -d 数据库 -c 表名 --type 类型 --headerline --upsert --drop 文件名  
上面三种情况，还可以有其他排列组合的。
2,还原导出的表数据
[root@localhost mongodb]# mongoimport -d tank -c users --upsert tank/users.dat 
connected to: 127.0.0.1 
Tue Dec 3 08:26:52.852 imported 4 objects

3,部分字段的表数据导入
[root@localhost mongodb]# mongoimport -d tank -c users  --upsertFields uid,name,sex  tank/users.dat  
connected to: 127.0.0.1  
Tue Dec  3 08:31:15.179 imported 4 objects 
4,还原csv文件
[root@localhost mongodb]# mongoimport -d tank -c users --type csv --headerline --file tank/users.csv 
connected to: 127.0.0.1 
Tue Dec 3 08:37:21.961 imported 4 objects 

总体感觉，mongodb的备份与还原，还是挺强大的，虽然有点麻烦。
您可能感兴趣的文章:
基于MongoDB数据库的数据类型和$type操作符详解
MongoDB入门教程之细说MongoDB数据库的增删查改操作
MongoDB常用操作命令大全
MongoDB数据库文档操作方法(必看篇)
