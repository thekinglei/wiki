confluence安装过程；

1、官网下载atlassian-confluence-6.3.3.tar.gz  
2、解压  
3、修改配置：atlassian-confluence-6.3.3/confluence/WEB-INF/classes/confluence-init.properties  
设置数据目录：confluence.home=/opt/CONFLUENCE_HOME  
4、启动 ./bin/start-confluence.sh  
5、按照步骤一步步安装，与jira类似，涉及到数据库安装选择是，选择最底下不安装数据库（俺需要，可以设置成pg或者mysql
），设置admin账号密码 ，默认端口是8090，可以自行设置端口：./conf/server.xml  
6、结束  

7、破解  
下载破解包：atlassian-extras-decoder-v2-3.2.jar ，覆盖 ./atlassian-confluence-6.3.3/confluence/WEB-INF/lib ，然后重启；  
