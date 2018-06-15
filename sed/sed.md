1、一般sed的格式为 sed -i -e "s/src/dest/g" filename，但是也不绝对，对于src中包含了 "/"等特殊字符的情况，需要用反斜杠"\"进行转义，但是不建议这样做  
建议的方式将 "/" 替换为其他字符，比如逗号","： sed -i -e "s,src,dest,g" filename  ,就不需要对特殊字符转义了，也不容易出错
