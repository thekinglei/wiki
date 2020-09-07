#!/bin/bash
#H2 change to mysql
#创建mysql：
#Mysql version >=5.7.7

#create database：metabase
#
#msyql > CREATE DATABASE `metabase` /*!40100 DEFAULT CHARACTER set  utf8mb4;
#mysql > set GLOBAL innodb_large_prefix=ON;
#



#变更数据库：从h2 to mysql
docker run --name metabase-migration \
    -v /path/metabase_backup:/metabase-data \
    -e "MB_DB_FILE=/metabase-data/metabase.db" \
    -e "MB_DB_TYPE=mysql" \
    -e "MB_DB_DBNAME=metabase" \
    -e "MB_DB_PORT=3306" \
    -e "MB_DB_USER=root" \
    -e "MB_DB_PASS=passworkd" \
    -e "MB_DB_HOST=1.1.1.1" \
     metabase/metabase:v0.35.3  load-from-h2
~                                               
