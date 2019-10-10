#!/bin/sh

if [ ! -f /www/server/panel/data/notfirst ]; then
# 根据环境变量修改用户名和密码
cp -r /thas/panel/data /www/server/panel/
sh -c  '/bin/echo -e "$PASSWORD" | /bin/bt 5' && sh -c  '/bin/echo -e "$USERNAME" | /bin/bt 6'
echo '此文件用于表示已经设置过用户名和密码了' > /www/server/panel/data/notfirst
fi

if [ ! -f /www/server/nginx/conf/notfirst ]; then
## 首次启动时补充由于映射volume丢失的文件
cp -r /thas/nginx/conf /www/server/nginx/
echo '此文件用于表示非首次启动' > /www/server/nginx/conf/notfirst
fi

# 启动宝塔面板
/bin/bt 3
/etc/init.d/mysqld* start
/etc/init.d/nginx* start
/etc/init.d/httpd start
/etc/init.d/pure-ftpd start
