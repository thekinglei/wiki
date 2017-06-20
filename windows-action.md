1、通过vsphdere创建的虚机（windows虚机），安装vmware-tools失败时，很难通过图形界面修改配置，导致也无法远程
解决办法：
1）通过快捷键win + r，打开“运行”，输入cmd，敲回车，进入命令行界面
2）执行命令 netsh firewall set  opmode disable，关闭防火墙
3）配置远程登录为允许，此时可以远程登录虚机进行操作了
