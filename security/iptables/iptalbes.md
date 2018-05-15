iptables 简单用法

查看当前的规则：

iptables -L -n



iptables关闭所有端口，只开放端口22，,80  
iptables -A INPUT -p tcp --dport 22-j ACCEPT  
iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT  
iptables -A INPUT -p tcp --dport 80 -j ACCEPT  
iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT  
iptables -P INPUT DROP  
iptables -P FORWARD DROP  
iptables -P OUTPUT DROP  

上边失败，修正为如下  
规则：1、eth0端口所有网卡ip内网可访问，服务可访问，是内网IP；2、eth1 22 、80端口可访问 3、可访问外网，如baidu.com；4、本机可访问内网；



#/bin/bash

iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 8020 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 8020 -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -P INPUT DROP
iptables -A INPUT -i eth0 -j ACCEPT
