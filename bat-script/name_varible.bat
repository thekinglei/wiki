echo "命名爬虫名称，部署目录"
set carwler_name=jxmodule_1
set base_dir=E:\test\

echo "设置scp软件目录"
set SCP_HOME=C:\Program Files (x86)\WinSCP
set ziptool=C:\Program Files\7-Zip
set PATH=%SCP_HOME%;%WINRAR%


echo "创建工作目录：爬虫代码部署路径"
md %base_dir%%carwler_name%

set carwler_log=jxmodule_log.txt

WinSCP.exe /console /command "option batch continue" "option confirm off" "open sftp://es:$!KingStar*(di*)&^WS@119.57.161.52:22379" "option transfer binary" "put E:\test\jxmodule\package_jxmodule_md5.txt /opt/data/jxmodule/task/%carwler_name% " "exit" /log=E:\test\%carwler_log%