通过jenkins构建移动端项目（android/ios）

一、构建项目，并在构建历史中打印二维码。
环境准备：
## 使用生成二维码工具（myqr）

##源码使用：github地址：https://github.com/sylnsfar/qrcode.git

## python安装方式： pip3 install myqr

1、生成二维码
myqr "app_apk_download_Url" -D $WORKSPACE -n app.png


2、配置jenkins job
归档，将二维码保存在jenkins job的构建历史文件中。

插件：归档成品

  Files to archive: app.png
  
 
打印二维码：

    插件：Set build description
    
      设置内容： <img src="${BUILD_URL}artifact/app.png" width="180" height="180" />
