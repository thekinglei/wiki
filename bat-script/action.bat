CD /d E:\test

del /q E:\test\jxmodule\jxmodule.tar.gz
del /q E:\test\jxmodule\package_jxmodule_md5.txt
del /q E:\test\jxmodule\carwler_1
md E:\test\jxmodule\
CD /d C:\Program Files (x86)\WinSCP
WinSCP.exe /console /command "option batch continue" "option confirm off" "open sftp://es:$!KingStar*(di*)&^WS@119.57.161.52:22379" "option transfer binary" "get /opt/data/jxmodule/package_jxmodule_md5.txt E:\test\jxmodule\" "exit" /log=E:\test\log.txt

WinSCP.exe /console /command "option batch continue" "option confirm off" "open sftp://es:$!KingStar*(di*)&^WS@119.57.161.52:22379" "option transfer binary" "get /opt/data/jxmodule/jxmodule.tar.gz E:\test\jxmodule\" "exit" /log=E:\test\log.txt

WinSCP.exe /console /command "option batch continue" "option confirm off" "open sftp://es:$!KingStar*(di*)&^WS@119.57.161.52:22379" "option transfer binary" "put E:\test\jxmodule\package_jxmodule_md5.txt /opt/data/jxmodule/task/carwler_1 " "exit" /log=E:\test\log.txt
