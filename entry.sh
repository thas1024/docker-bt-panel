#!/bin/sh
sh start.sh & 

prog_exit()
{
	sh stop.sh
}
# 注册中断处理函数
trap "prog_exit" 15

flag=1
while [ $flag -ne 0 ];do
    sleep 3;
	# 以宝塔面板的python进程作为容器死亡的判断条件
    flag=`ps -ef| grep python |grep -v grep | wc -l`
done;
