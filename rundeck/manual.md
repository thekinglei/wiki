1、下载地址：http://rundeck.org/downloads.html，比如下载rundeck-launcher-2.8.2.jar或者最新
2、将下载好的java，存放于某一个目录下，比如：/opt/rundeck/
3、设置服务器hostname：/etc/hostname  （配置为主机IP:192.168.2.28），并通过命令hostname -F /etc/hostname生效，
运行这个原因在于，rundeck启动时，会读取此配置并保存到配置文件，如果不配置为IP或者局域网可解析的域名，会导致其他机器无法访问rundeck

4、进入 /opt/rundeck/ 目录，执行nohup java -jar rundeck-launcher-2.8.2.jar &
  启动成功后：目录内容如下
  etc  libext  projects  rundeck-launcher-2.8.2.jar  server  tools  var
  
5、可以看下etc/framework.properties 部分配置，可以看见配置了当前主机IP，参考第3步，如果不配置，这里IP就会设置成一个无法解析的域名，导致其他机器访问rundeck
时，页面跳转异常找不到，其他一些配置项也用了/etc/hostname，就不再举例了，可以自行grep下
framework.server.name = 192.168.2.38
framework.server.hostname = 192.168.2.38
framework.server.port = 4440
framework.server.url = http://192.168.2.38:4440

6、rundeck启动成功，通过浏览器访问，默认账号密码：admin/admin
   修改amdin账号密码：在rundeck工作目录下： etc/preferences.properties
   默认配置：framework.server.password=admin
   
   添加调整账号密码：
 
   修改配置文件：server/config/realm.properties
   说明：添加用户：test，密码：testpassword，用户类型：user，admin
   #
# This file defines users passwords and roles for a HashUserRealm
#
# The format is
#  <username>: <password>[,<rolename> ...]
#
# Passwords may be clear text, obfuscated or checksummed.  The class 
# org.mortbay.util.Password should be used to generate obfuscated
# passwords or password checksums
#
# This sets the temporary user accounts for the Rundeck app
#
admin:admin,user,admin
user:user,user
test:testpassword,user,admin
   

