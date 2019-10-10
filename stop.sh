#!/bin/sh
# 关闭Web
/etc/init.d/nginx* stop
/etc/init.d/httpd stop
# 关闭mysql
/etc/init.d/mysqld* stop
# 停止宝塔面板
/bin/bt 2
