1、想要删除提交历史中某一次的提交，包括提交log和文件内容  
有两种方法，  
一种是rebase -i 'commit-id'^ 的方式，搜索下答案  

第二种：打补丁  
操作步骤：
比如master上提交日志为：1 ，2 ，3 ，4 ，5  

现在想删除第3次提交，操作步骤：  
git checkout master  
git diff commit-3-id commit-5-id > /somewhere/path #将待删除的id号到最新的（HEAD）之间的差别，打补丁到文件path  
git branch  tmp_branch  commit-2-id #从第二次提交 创建新的临时分支  
git checkout tmp_branch  
git apply /somewhere/path #将补丁应用到临时分支上  
git push origin tmp_branch:master -f #将本地删除掉提交3的分支tmp_branch强推到远程master上， 将源master进行覆盖（慎用）；  

