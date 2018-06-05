centos安装jenkins：  
直接通过命令安装  
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins

安装成功后，通过脚本 /etc/init.d/jenkins start启动时报错说需要通过systemctl启动  
通过systemctl start jenkins.service可能会报错，原因是找不到java，需要安装java或者将已安装的java软连接到/usr/bin/java    
Jun  5 16:57:58 monitor systemd: Failed to start LSB: Jenkins Automation Server.
Jun  5 16:57:58 monitor systemd: Unit jenkins.service entered failed state.
Jun  5 16:57:58 monitor systemd: jenkins.service failed.
