#coding=utf-8
import json
import pymongo
import commands as cds
from pymongo import MongoClient


def show_connections(Host,Port,db_name):
    conn = MongoClient(host=Host,port=Port)
    #my_db = conn.db_name
    my_db = conn.__getattr__(db_name)
    #print my_db
    colls = my_db.collection_names()
    print colls

def show_databases(Host,Port):
    conn = MongoClient(host=Host,port=Port)
    print conn.database_names()

if __name__ == "__main__":
    show_connections("127.0.0.1",27017,"wl")
    #show_databases("127.0.0.1",27017)




