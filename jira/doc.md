jira安装记录，如果是atlassian-jira-software-7.3.8-standalone.tar.gz包的话

1、解压后，参看README.txt

1、设置jira_home：

1）配置文件：atlassian-jira/WEB-INF/classes/jira-application.properties

jira.home =/opt/JIRA_HOM  #注意不要有空格，引号等，


2、启动
./bin/start-jira.sh 

3、默认是IP:8080 ，选择第二项 next

   数据库选择了系统默认的数据库

4、修改默认端口
修改conf/server.xml中将8080改为80


5、备份恢复
备份：将JIRA_HOME整个目录备份
恢复：将备份文件整个覆盖即可
