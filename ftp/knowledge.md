1、安装vsftpd
yum install -y vsftpd || apt-get -y install vsftpd

以centos为例，安装成功后  
修改配置文件，配置文件目录：  
/etc/vsftpd

目录文件如下：  
ftpusers  
user_list  
vsftpd.conf  
vsftpd_conf_migrate.sh  


修改配置文件：vsftdp.conf  

userlist_deny=NO  
userlist_enable=YES  
local_root=/var/ftp/pub/data  #修改登录后的默认目录  
chroot_list_enable=YES  
chroot_list_file=/etc/vsftpd/chroot_list  #指定登录用户的根目录  
allow_writeable_chroot=YES  #指定的用户目录读写权限  

修改监听IP：  
listen=YES  
listen_ipv6=NO  

创建vsftpd用户及目录
useradd ftptest -s /sbin/nologin  
password ftptest  


mkdir /etc/vsftpd/userconf  
cd /etc/vsftpd/userconf  
echo "ftptest" >> /etc/vsftpd/userconf/ftptest  #设置用户目录  
echo "ftptest"  >> /etc/vsftpd/user_list  

#重启vsftpd
service vsftpd restart


