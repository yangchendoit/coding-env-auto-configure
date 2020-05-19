#!/bin/bash

# $PWD 环境变量 当前绝对路径
source $PWD/scripts/echo.sh
source $PWD/scripts/base.sh
source $PWD/scripts/node.sh


echo "-----------------------------------------------"
# 生成ssh key 如果没有就自动来一个!
info "验证下是否有ssh key,如果没有会帮你生成一个..."

if  [[ ! -f ~/.ssh/id_rsa.pub ]] 
then
	info "我觉得直接回车默认就好.. 不过千万别弄没了. 生成的文件在~/.ssh/目录"
	ssh-keygen -t rsa
	info "顺便在备份一次,省得你弄没了. .bak文件是备份哈!"
	cp ~/.ssh/id_rsa.pub ~/.ssh/id_rsa.pub.bak
	cp ~/.ssh/id_rsa ~/.ssh/id_rsa.bak
else
	ok "你已经有了,在目录:~/.ssh/ ,自动跳过这个步骤!"
fi

source $PWD/scripts/app.sh
source $PWD/scripts/welcome.sh







