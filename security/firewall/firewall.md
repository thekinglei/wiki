firewall 用法

说明：firewall-cmd是存在于iptables 之上的命令，底层也是iptables，通过firewall-cmd组织iptables规则

1、查看当前暴露的端口和服务,关注public模块暴露的端口

firewall-cmd --list-all-zones

命令结果截取如下：

public (active)
  target: default
  icmp-block-inversion: no
  interfaces: enp1s0 enp5s0
  sources: 
  services: dhcpv6-client ssh
  ports: 80/tcp 22/tcp 8180/tcp 8280/tcp 9200/tcp 27017/tcp 9300/tcp 
  protocols: 
  masquerade: no
  forward-ports: 
  sourceports: 
  icmp-blocks: 
  rich rules:
  
  

2、添加暴露的端口：添加暴露8080端口，http

注意此命令，重启虚机后就失效了  
firewall-cmd --add-port=8080/tcp  

如果要永久开放8080端口，加参数 --permanent  
firewall-cmd --add-port=8080/tcp --permanent  

重载配置  
firewall-cmd --reload


3、将所2-65525的端口都放开  
firewall-cmd --add-port=2-65525/tcp --permanent
