#!/bin/bash

# 学习 http://c.biancheng.net/view/3472.html

# 这里只列出部分

# 变量
# 运行shell时会存在三种变量 局部变量 全局变量 shell变量

# 特殊变量
# $0	当前脚本的文件名
# $n	传递给脚本或函数的参数。n 是一个数字，表示第几个参数。例如，第一个参数是$1，第二个参数是$2。
# $#	传递给脚本或函数的参数个数。
# $*	传递给脚本或函数的所有参数。
# $@	传递给脚本或函数的所有参数。被双引号(" ")包含时，与 $* 稍有不同，下面将会讲到。
# $?	上个命令的退出状态，或函数的返回值。
# $$	当前Shell进程ID。对于 Shell 脚本，就是这些脚本所在的进程ID。

name="blakecyang"
# 使用 ${name} $name

array=(1 2 3)

number=1

echo "hello ${name}"

# 运算

# -eq	检测两个数是否相等，相等返回 true。	[ $a -eq $b ] 返回 false。
# -ne	检测两个数是否不相等，不相等返回 true。	[ $a -ne $b ] 返回 true。
# -gt	检测左边的数是否大于右边的，如果是，则返回 true。	[ $a -gt $b ] 返回 false。
# -lt	检测左边的数是否小于右边的，如果是，则返回 true。	[ $a -lt $b ] 返回 true。
# -ge	检测左边的数是否大于等于右边的，如果是，则返回 true。	[ $a -ge $b ] 返回 false。
# -le	检测左边的数是否小于等于右边的，如果是，则返回 true。	[ $a -le $b ] 返回 true。

# !	非运算，表达式为 true 则返回 false，否则返回 true。	[ ! false ] 返回 true。
# -o	或运算，有一个表达式为 true 则返回 true。	[ $a -lt 20 -o $b -gt 100 ] 返回 true。
# -a	与运算，两个表达式都为 true 才返回 true。	[ $a -lt 20 -a $b -gt 100 ] 返回 false。

# -d file	检测文件是否是目录，如果是，则返回 true。	[ -d $file ] 返回 false。
# -f file	检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回 true。	[ -f $file ] 返回 true。
# -r file	检测文件是否可读，如果是，则返回 true。	[ -r $file ] 返回 true。
# -w file	检测文件是否可写，如果是，则返回 true。	[ -w $file ] 返回 true。
# -x file	检测文件是否可执行，如果是，则返回 true。	[ -x $file ] 返回 true。
# -s file	检测文件是否为空（文件大小是否大于0），不为空返回 true。	[ -s $file ] 返回 true。
# -e file	检测文件（包括目录）是否存在，如果是，则返回 true。	[ -e $file ] 返回 true。


# 输出 echo printf(echo 增强版)


# 逻辑

if [ -f $PWD/test/example.sh -a -f $PWD/test/example.sh ]
then 
  cat $PWD/test/a.js > $PWD/test/b.js
else 
  echo "没有"
fi

if [[ -f $PWD/test/example.sh ]]
then 
  echo "存在"
else 
  echo "没有"
fi


echo 'Input a number between 1 to 4'
echo 'Your number is:\c'
read aNum
case $aNum in
    1)  echo 'You select 1'
    ;;
    2)  echo 'You select 2'
    ;;
    3)  echo 'You select 3'
    ;;
    4)  echo 'You select 4'
    ;;
    *)  echo 'You do not select a number between 1 to 4'
    ;;
esac

for loop in 1 2 3 4 5
do
    echo "The value is: $loop"
done

COUNTER=0
while [ $COUNTER -lt 5 ]
do
    COUNTER=`expr $COUNTER + 1`
    echo "while ${COUNTER}"
done

# util 与 while 语意相反，语法一致

# 跳出循环 break

# 函数

hello(){
	echo $1
}

hello "hello world"


# 输入输出重定向

# 一般情况下，每个 Unix/Linux 命令运行时都会打开三个文件：
# 标准输入文件(stdin)：stdin的文件描述符为0，Unix程序默认从stdin读取数据。
# 标准输出文件(stdout)：stdout 的文件描述符为1，Unix程序默认向stdout输出数据。
# 标准错误文件(stderr)：stderr的文件描述符为2，Unix程序会向stderr流中写入错误信息。

# 输出重定向 > (覆盖) >> (追加)
# 输入重定向 <（覆盖) << (追加)

# EOF ： Here Document 是 Shell 中的一种特殊的重定向方式，用来将输入重定向到一个交互式 Shell 脚本或程序。
cat << EOF
This is a simple lookup program
for good (and bad) restaurants
in Cape Town.
EOF

# /dev/null 文件

# 如果希望执行某个命令，但又不希望在屏幕上显示输出结果，那么可以将输出重定向到 /dev/null：
# $ command > /dev/null
# /dev/null 是一个特殊的文件，写入到它的内容都会被丢弃；如果尝试从该文件读取内容，那么什么也读不到。但是 /dev/null 文件非常有用，将命令的输出重定向到它，会起到”禁止输出“的效果。

# 如果希望屏蔽 stdout 和 stderr，可以这样写：
# $ command > /dev/null 2>&1


# test 简写 [] 
# [[]] 比test更强大

# 包含
# source 或 .
# 被包含脚本不需要执行权限

echo "done"