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

