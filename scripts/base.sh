#!/bin/bash
# 安装brew详见其官网: https://brew.sh/index_zh-cn 

echo "-----------------------------------------------"
echo "安装brew"

# 输出重定向：屏蔽输出及错误
# 2>&1 
# 1: stdout 2:stderr 
# > /dev/null 
# /dev/null 是一个特殊的文件，写入到它的内容都会被丢弃，重定向到它可以将输出屏蔽 
if  ! command -v brew > /dev/null 2>&1 
then
	warn "没安装,来自动装一个.homebrew!"
	# 官网推荐的brew安装方式:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	export SHELL="/bin/zsh"
else
	ok "你已经安装好brew,自动跳过这个步骤!"
fi

echo "-----------------------------------------------"
echo "brew安装zsh 和 oh_my_zsh:"

# $SHELL 当前shell

if $SHELL != "/bin/zsh" 
then
	warn "没安装,来自动装一个."

	brew install zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting

	warn "切换shell时会退出，请重新执行 make"
	# 切换到zsh为默认shell
	chsh -s $(which zsh)
else
	ok "你已经安装好zsh,自动跳过这个步骤!"
fi

echo "-----------------------------------------------"
echo "安裝git:"
git --version

# $? 特殊变量 上个命令退出状态 命令退出状态为0 惯例表示成功（存在特殊情况如diff 0 无差别 1 有差别）
# -ne 含义等同 !=
if  [ `echo $?` -ne 0 ] 
then
	brew install git
else
	ok "git 安装完成!"
fi


echo "-----------------------------------------------"
echo "安装on-my-zsh"
# 安装oh_my_zsh(前置安装zsh & git)
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


if ! grep "source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ~/.zshrc; 
	then
		echo "source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
fi

if ! grep "source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ~/.zshrc; 
	then
		echo "source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
fi



echo "-----------------------------------------------"
echo '配置腾讯研发网络代理至.zshrc'

if ! grep 'export http_proxy=http://127.0.0.1:12639' ~/.zshrc; 
	then
		echo 'export http_proxy=http://127.0.0.1:12639' >> ~/.zshrc
    echo 'export https_proxy=http://127.0.0.1:12639' >> ~/.zshrc
    echo 'export no_proxy="git.code.oa.com,r.tnpm.oa.com,*.mnet2.com,ngw.oa.com"' >> ~/.zshrc
fi

echo "-----------------------------------------------"
echo "安装brew的一些常用库"
brew tap homebrew/cask
brew tap homebrew/cask-versions

echo "-----------------------------------------------"
echo "开发环境基础组件安装完成!!"
echo "-----------------------------------------------"