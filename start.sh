#!/bin/sh
# 根据环境变量修改用户名和密码
sh -c  '/bin/echo -e "$PASSWORD" | /bin/bt 5' && sh -c  '/bin/echo -e "$USERNAME" | /bin/bt 6' &&
# 启动宝塔面板
/bin/bt 3
/etc/init.d/mysqld* start
/etc/init.d/nginx* start
/etc/init.d/httpd start
/etc/init.d/pure-ftpd start
