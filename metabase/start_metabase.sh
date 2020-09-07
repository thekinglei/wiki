#!/bin/bash
# 创建数据库，并设置权限参数
#msyql > CREATE DATABASE `metabase`  DEFAULT CHARACTER set  utf8mb4;
#mysql > set GLOBAL innodb_large_prefix=ON;
#

#start metabase whith mysql db
PORT=9889
docker run -d --name metabase-${PORT} \
    -p $PORT:3000 \
    -e "MB_DB_TYPE=mysql" \
    -e "MB_DB_DBNAME=metabase" \
    -e "MB_DB_PORT=3306" \
    -e "MB_DB_USER=root" \
    -e "MB_DB_PASS=passwd" \
    -e "MB_DB_HOST=1.1.1.1" \
     metabase/metabase:v0.35.3
