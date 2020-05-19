#!/bin/bash

echo "-----------------------------------------------"
if  ! command -v nvm > /dev/null 2>&1
then
  warn "开始安装nvm"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
else
  ok "你已经安装了nvm"
fi

echo "-----------------------------------------------"
echo "配置nvm至.zshrc"

if ! grep 'export NVM_DIR="$HOME/.nvm"' ~/.zshrc; 
	then
		warn 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
    warn '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.zshrc
    warn '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> ~/.zshrc
fi

source ~/.zshrc

echo "-----------------------------------------------"
echo "开始安装node v10.17.0"
nvm install 10.17.0

echo "-----------------------------------------------"
echo "安装tnpm  http://tnpm.oa.com/"
npm install @tencent/tnpm -g --registry=http://r.tnpm.oa.com --proxy=http://r.tnpm.oa.com:80 --verbose

echo "-----------------------------------------------"
echo "安装whsitle 基于 Node 实现的跨平台抓包调试代理工具"
npm install -g whistle

