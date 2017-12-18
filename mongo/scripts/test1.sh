#!/bin/bash  
#显示库wl所有的connection  
mongo wl --eval "printjson(db.runCommand({"listCollections":1}))"  
#显示所有库  
mongo admin --eval "printjson(db.runCommand({"listDatabases":1}))" 
