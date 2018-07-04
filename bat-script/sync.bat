CD /d C:\Program Files (x86)\WinSCP

%说明：synchronize 默认无法同步删除；覆盖永远无法实现%
WinSCP.exe /console /command "option batch continue" "option confirm off" "open sftp://es:$!KingStar*(di*)&^WS@119.57.161.52:22379" "option transfer binary" "synchronize local E:\test\advertising /home/es/wekafiles " "exit" /log=E:\test\log.txt