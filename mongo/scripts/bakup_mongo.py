#coding=utf-8
import json
import pymongo
import commands as cds
import time
from pymongo import MongoClient

admin_user = "wl"
admin_pwd = "testpwd"

bak_db = "wl"
bak_user = "testdb"
bak_pwd = "testpwd"
bak_dir = "/data/backup"

source_dir = "/var/backup/mongo"
dest_ip = ""
dest_dir = ""

def show_connections(Host,Port,db_name,user,pwd):
    conn = MongoClient(host=Host,port=Port)
    #my_db = conn.db_name
    my_db = conn.__getattr__(db_name)
    my_db.authenticate(user,pwd)
    #print my_db
    colls = my_db.collection_names()
    print colls
    return colls

def show_databases(Host,Port):
    conn = MongoClient(host=Host,port=Port)
    print conn.database_names()

def main(host,port,db_name,backup_dir,user,pwd):
    colls = show_connections(host,port,db_name,user,pwd)
    for i in colls:
        coms = cds.getstatusoutput("mongodump --username %s --password %s --authenticationDatabase admin -d %s -c %s -o %s"%(admin_user,
               admin_pwd,db_name, i, backup_dir))
        if coms[0] == 0:
            continue
        else:
            print coms[1]
            print "backup failure"
            return -1

    do_tar_cmd = "cd %s;tar zcvf %s.tar.gz %s" % (backup_dir, db_name, db_name)
    res = cds.getstatusoutput(do_tar_cmd)
    if res[0] != 0:
        print "tar failure"
        return -1

    print "backup mongo success"
    return 1

def scp_files(source_dir,dest_ip,dest_dir):
    scp_command = "scp %s  %:%/" % (source_dir,dest_ip,dest_dir)
    res = cds.getstatusoutput(scp_command)
    if res[0] != 0:
        print "scp failure"
        return -1
    return 1
if __name__ == "__main__":
    #main("127.0.0.1",27017,"wl","/data/backup","testdb","testpwd")
    main("127.0.0.1",27017, bak_db, bak_dir, bak_user, bak_pwd)


