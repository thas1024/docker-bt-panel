#!/bin/sh

if [ ! -f /www/server/panel/data/default.db ]; then
# 根据环境变量修改用户名和密码
sh -c  '/bin/echo -e "$PASSWORD" | /bin/bt 5' && sh -c  '/bin/echo -e "$USERNAME" | /bin/bt 6'
fi

if [ ! -f /www/server/nginx/conf/nginx.conf ]; then
## 首次启动时补充由于映射volume丢失的文件
cp -nr /thas/nginx/conf /www/server/nginx/
fi

# 启动宝塔面板
/bin/bt 3
/etc/init.d/mysqld* start
/etc/init.d/nginx* start
/etc/init.d/httpd start
/etc/init.d/pure-ftpd start
