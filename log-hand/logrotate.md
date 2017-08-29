logrotate是一款日志管理工具，通过配置相关的配置文件，它可以自动对日志进行截断（或轮循）、压缩以及删除旧的日志文件


以mongo为例，mongo服务器运行中，日志读写非常快，mongo.log很快就能达到几个G的大小，影响日志读写效率，需要对文件进行转移备份

对mongo日志进行阶段和压缩，创建配置文件：touch  /etc/logrotate.d/mongo.log  

/var/log/mongo-logs/mongodb.log {  
	daily  
	rotate 5  
	compress  
	delaycompress  
  size 1000M  
  create 644 root root  
	missingok  
	notifempty  
}  

配置项说明：  
/var/log/mongo-logs/mongodb.log： mongo日志存储地址，填写对应的服务器日志文件地址即可  
daily：  日志文件将按月轮循。其它可用值为‘daily’，‘weekly’或者‘yearly’  
rotate 5：一次将存储5个归档日志。对于第六个归档，时间最久的归档将被删除  
compress：压缩  
size 1000M：  日志大小达到1000M时，则进行截取归档
delaycompress:总是与compress选项一起用，delaycompress选项指示logrotate不要将最近的归档压缩，
压缩将在下一次轮循周期进行。这在你或任何软件仍然需要读取最新归档时很有用  
missingok: 在日志轮循期间，任何错误将被忽略，例如“文件无法找到”之类的错误  
notifempty: 如果日志文件为空，轮循不会进行  
create 644 root root: 以指定的权限创建全新的日志文件，同时logrotate也会重命名原始日志文件，如果是其他用户权限，请填写指定用户  
postrotate/endscript: 在所有其它指令完成后，postrotate和endscript里面指定的命令将被执行。在这种情况下，rsyslogd 进程将立即再次读取其配置并继续运行。  


上面的模板是通用的，而配置参数则根据你的需求进行调整，不是所有的参数都是必要的



PS：
经过实践，执行完logrotate后，mongo无法再往mongdb.log中写日志，意味着，每次执行完logrotate 后，必须重启mongo，因此暂时不用这种方式  
目前能想到的办法是做mongo集群或者分片，在logrotate截取日志时，同时重启mongo，因为是集群或者分片，并不影响mongo使用  
另一种手动处理方式；
#mongo  
use admin  
db.runCommand({logRotate:1})  




