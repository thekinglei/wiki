activemmq设置：  

1、一般情况下默认就可以了  
如果涉及到内网安装，需要更改服务器默认监听端口，更改配置如下  
1）解压后，cd rabbitmq_server-3.5.1/etc/rabbitmq/  
cp rabbitmq.config.example rabbitmq.config

2）修改rabbitmq.config配置默认端口，注意大括号结尾的逗号问题  
比如修改默认http监听端口15672到 12345
   {listener, [{port,     12345},  
               {ip,       "0.0.0.0"},  
               {ssl,      false}]  
   }
   
   
  修改默认的5672至8672，注意逗号问题  
  {tcp_listeners, [8672]}  
  
  服务器启动：./sbin/rabbitmq-server -detached
