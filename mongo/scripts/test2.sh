#!/bin/bash  
#说明show tables和show connections等同  
mongo admin <<EOF  
use wl  
show tables  
show connections
EOF
