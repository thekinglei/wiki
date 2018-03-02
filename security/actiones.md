在同一台机器上，不添加网卡的情况下（默认eth0），在eth0添加新的IP  
如eth（192.168.1.100）上天添加同网段IP 192.168.3.120  
ip addr add 192.168.3.194/24 dev eth0

删除此IP：  
ip addr delete 192.168.1.120/24 dev eth0
