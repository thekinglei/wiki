# 1、集群创建不过期token
kubeadm token create --ttl 0

#检查token
kubeadm token list



#2、重新初始化集群
#清理数据
#kubeadm reset
#rm -rf /etc/kubenetes/pki/*

#关闭etcd集群，并备份数据，清理备份数据
#rm -rf /var/lib/etcd/*
#rm -rf /var/etcd/*


#初始化
#kubeadm init --config kubeadm-config.yaml
