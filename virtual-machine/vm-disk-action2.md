二、扩展磁盘到新建指定目录

一）扩展虚机磁盘并挂载到指定目录；
步骤：
1、通过vsphere扩展

2、登录ubuntu或centos

3、fdisk -l

4、 fdisk /dev/sda

    n
	p
	默认一个新的数字，根据提示选一个数字，或者默认值，比如3，回车
	
	默认分区初始值，回车
	
	默认分区末尾值，回车（此时不再有任何空余空间了，如果不想一次使用完毕，就比默认值小点）
	
	wq，保存
	
5、格式化：mkfs -t ext4 /dev/sda3

6、partprobe  （可选）

7、mount /dev/sda3 /opt

8 vim /etc/fstab ,设置开机自动挂载


/dev/mapper/cl-swap     swap                    swap    defaults        0 0

9、此时/opt 目录挂载到了 /dev/sda3 分区，所有扩展的磁盘都在此分区下

