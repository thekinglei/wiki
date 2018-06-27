清华大学开源镜像库，gitlab rpm 包；  
下载好指定版本后，直接 rpm -i 包名； 即可  
如果重装，则 rpm -i --reinstall 包名  
执行完成后，执行gitlab-ctl reconfigure ，如果修改了 /etc/gitlab/gitlab.rb,此命令再执行一次  


克隆仓库时，发现仓库地址是git@gitlab.com:machine-learn/news-second.git 这种格式，将gitlab.com改为服务器IP  
vim /var/opt/gitlab/gitlab-rails/etc/gitlab.yml  

  gitlab:
    ## Web server settings (note: host is the FQDN, do not include http://)
    host: gitlab.com ,将其改为IP即可
    port: 80
    https: false

