#!/bin/bash

# Git 安装
yum -y install git
# 安装完成后，还需要最后一步设置
git config --global user.name "Your Name"
git config --global user.email "email@example.com"

# 创建版本库
mkdir -p /data/learngit
cd /data/learngit
# 通过 git init命令把这个目录变成git可以管理的仓库
git init

# 1、通过 git add将文件添加到仓库；
git add readme.txt

# 2、通过 git commit 将文件提交到仓库；
git commit -m "wrote a readme file"

# 版本回退，通过 git log命令查看
git log
git log --pretty=oneline
# 在Git中,用HEAD表示当前版本,上一个版本就是HEAD^
# 回退到上一个版本
git reset --hard HEAD^
# git reflog 用来查看命令历史

# 工作区和暂存区
# 使用git checkout -- file 可以丢弃工作区的修改:
git checkout -- readme.txt

# 删除文件
git rm test.txt
git commit -m "remove the test.txt"


######## 远程仓库
# 注册github账户，通过ssh加密设置，创建SSH KEY 复制根目录id_rsa_pub
ssh-keygen -t rsa -C "youremail@example.com"

# 在 github SSH keys中添加秘钥
# 在本地仓库下运行命令；
git remote add origin git@github.com:danlansedefeng/kvm.git

# 将本地库所有内容推送到远程库上
git push -u origin master

# 从远程库克隆
git clone git@github.com:danlansedefeng/kvm.git

# 创建与合并分支
# 查看分支
git branch
# 创建分支
git branch <name>
# 切换分支
git checkout <name>
# 创建+切换分支
git checkout -b <name>
# 合并某分支到当前分支
git merge <name>
# 删除分支
git branch -d <name>


# 分支管理策略
# 准备合并dev分支,请注意 --no-ff参数，标识禁用 Fast forward
git merge --no-ff -m "merge with no-ff" dev

# 查看分支历史
git log --graph --pretty=oneline --abbrev-commit





############ GITLAB 安装 ###############
# https://about.gitlab.com/installation/#centos-7

1、配置yum源
vim /etc/yum.repos.d/gitlab-ce.repo

[gitlab-ce]
name=Gitlab CE Repository
baseurl=https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/yum/el$releasever/
gpgcheck=0
enabled=1

yum install gitlab-ce  

GitLab常用命令
sudo gitlab-ctl start    # 启动所有 gitlab 组件；
sudo gitlab-ctl stop        # 停止所有 gitlab 组件；
sudo gitlab-ctl restart        # 重启所有 gitlab 组件；
sudo gitlab-ctl status        # 查看服务状态；
sudo gitlab-ctl reconfigure        # 启动服务；
sudo vim /etc/gitlab/gitlab.rb        # 修改默认的配置文件；
gitlab-rake gitlab:check SANITIZE=true --trace    # 检查gitlab；
sudo gitlab-ctl tail        # 查看日志；


