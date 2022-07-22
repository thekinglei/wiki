yum install -y netdata
调整配置项127.0.0.1 为 0.0.0.0

#/etc/netdata/conf.d/python.d/anomalies.conf:    host: '0.0.0.0:19999'

systemctl restart netdata

#
refer to [https://github.com/ktsaou/netdata]
