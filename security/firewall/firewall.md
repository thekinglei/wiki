firewall 用法

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

firewall-cmd --add-port=8080/tcp


