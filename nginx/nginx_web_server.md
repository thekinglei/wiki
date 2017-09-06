##测试配置文件  
sudo /usr/sbin/nginx -t  
  
##修改配置文件  
##1. 在nginx文件中 server节点下有: include /etc/nginx/conf.d/*.conf  nginx会将conf.d文件下的*.conf文件全部自动引入到配置文件中，  
sudo vim /etc/nginx/nginx.conf  
  
##2. 在conf.d目录下   
  
cd /etc/nginx/conf.d  
sudo vim fileServer.conf  
---------------------------------  
##文件配置内容如下  
server {  
        client_max_body_size 4G;  
        ##注意80端口的占用问题  
        listen  80;  ## listen for ipv4; this line is default and implied   
        server_name    XXX.XXX.XXX;  ##你的主机名或者是域名  
    root /ysdata/upgrade_file/http;  
        location / {  
         autoindex on; ##显示索引  
                 autoindex_exact_size on; ##显示大小  
         autoindex_localtime on;   ##显示时间  
        }  
}  
##保存配置 
