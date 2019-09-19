# 配置jenkins master守护进程配置
## 1、超时配置
jenkins升级到LTS 2.164.3时，默认超时时间是30min（切换jenkins web页面，30min不访问即退出）

配置方法修改配置：/etc/sysconfig/jenkins,设置为1440（24小时）

JENKINS_ARGS="–sessionTimeout=1440"

/etc/sysconfig/jenkins
JENKINS_ARGS="–sessionTimeout=1440"



获取jenkins超时值方法，脚本命令行执行：

groovy脚本
import org.kohsuke.stapler.Stapler;
Stapler.getCurrentRequest().getSession().getMaxInactiveInterval() / 60


## 2其他配置参数，参考：

java -jar /usr/lib/jenkins/jenkins.war --help
