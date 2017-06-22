引用自：http://rundeckrun.readthedocs.io/en/latest/

1、安装相关python第三方包，可以直接操作rundeck服务器

easy_install rundeckrun


=====================================================================

import rundeck
from rundeck.client import Rundeck

rd = Rundeck("192.168.1.1", usr="admin",pwd="admin")
#或者rd = Rundeck("192.168.1.1", api_token="ecPor9jVOL1vmi6uYh6FBvmZVvTdfdfkZ")
projects = rd.list_projects()
my_job_id = rd.get_job_id("my_project_name","my_job_name")
rd.run_job(my_job_id)
