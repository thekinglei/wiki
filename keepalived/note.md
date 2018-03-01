安装keepalived：
官网下载最新版本的keepalived，我用了1.4.2  
cd keepalived-1.4.2  
./configure --prefix=/usr/local/keepalived  
make  
make install  

编译报错：checking libnfnetlink/libnfnetlink.h usability... no
yum install -y libnfnetlink-devel

keepalived.conf配置如下：
! Configuration File for keepalived

global_defs {
   notification_email {
     acassen@firewall.loc
     failover@firewall.loc
     sysadmin@firewall.loc
   }
   notification_email_from Alexandre.Cassen@firewall.loc
   smtp_server 192.168.1.1
   smtp_connect_timeout 30
   router_id LVS_DEVEL
   vrrp_skip_check_adv_addr
   vrrp_strict
   vrrp_garp_interval 0
   vrrp_gna_interval 0
}
vrrp_instance VI_1 {
    state BACKUP
    interface ens160
    virtual_router_id 51
    priority 80
    advert_int 5
    authentication {
        auth_type PASS
        auth_pass 1111
    }
    virtual_ipaddress {
        192.168.1.150
    }
}

virtual_server 192.168.1.150 80 {
    delay_loop 6
    lb_algo rr
    lb_kind DR
    persistence_timeout 50
    protocol TCP

    real_server 192.168.1.37 80 {
        weight 1
        TCP_CHECK {
            connect_timeout 3
            retry 3
            delay_before_retry 3
        }
    }

}



启动 keepalived -f /etc/keepalved/keepalive.conf  

注意：测试验证时如果keepalived和real_server在一台机器上，要将防火墙关闭，或者再次清空规则（我在测试中，keepalived和real_server在一台机器上，导致每
启动keepalved后，ping 虚拟IP可以ping通，但是访问网页总是失败，后来发现，keepalved会添加防火墙规则，所有ip请求虚拟ip都会drop，如下图）

target     prot opt source               destination         
DROP       all  --  0.0.0.0/0            192.168.1.150
