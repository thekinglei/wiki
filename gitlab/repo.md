清华大学开源镜像库，gitlab rpm 包；  
下载好指定版本后，直接 rpm -i 包名； 即可  
如果重装，则 rpm -i --reinstall 包名  
执行完成后，执行gitlab-ctl reconfigure ，如果修改了 /etc/gitlab/gitlab.rb,此命令再执行一次  
