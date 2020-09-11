1、将customer_hooks 放置到/opt/gitlab/embedded/service/gitlab-shell/hooks/下
2、权限置为777： chmoe 777 -R ./
3、配置/etc/gitlab/gitlab.rb,添加
gitlab_shell['custom_hooks_dir'] = "/opt/gitlab/embedded/service/gitlab-shell/hooks/customer_hooks"

4、gitlab-ctl reconfigure


说明：
customer_hooks/excludes:仓库排除，在排除列表的仓库，不做任何检查。
