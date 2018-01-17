一、安装saltstack  
 apt-get/yum   install salt-master salt-minion salt-api
 
 二、安装web界面
 
 1、克隆地址  
git clone https://github.com/saltstack/halite  /opt/halite  
2、生成index.html文件:   
cd /opt/halite/halite  
./genindex.py -C  
3、安装salt-api  
yum install salt-api  

4、配置master文件
vi /etc/salt/master
rest_cherrypy:
    host: 0.0.0.0
    port: 8080
    debug: true
    static: /usr/local/src/halite/halite
    app: /usr/local/src/halite/halite/index.html
external_auth:
    pam:
      admin:
            - '*'
           
        
注意：pam配置的用户不能是root，请新创建一个系统账号，并设置密码
    useradd test  
    password test

5、启动sap-api  
cd /usr/local/src/halite/halite  
python server_bottle.py -d -C -l debug -s cherrypy  
然后打开http://ip:8080/app，通过test/test登陆即可
