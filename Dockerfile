FROM centos:7

MAINTAINER thas thascc1024@gmail.com

ENV USERNAME=btpanel PASSWORD=btpanel

## 通过更改执行脚本名来触发重新构建
ENV FILENAME=install_bt_6.99.sh

COPY $FILENAME /data/install.sh

## 执行安装宝塔面板
RUN sh -c  '/bin/echo -e "y" | sh /data/install.sh'

## 修改用户名和密码 关掉安全验证
RUN sh -c  '/bin/echo -e "$PASSWORD" | /bin/bt 5' \
&& sh -c  '/bin/echo -e "$USERNAME" | /bin/bt 6' \
&& /bin/bt 11

## 默认安装nginx1.16
RUN sh /www/server/panel/install/install_soft.sh 1 install nginx 1.16

## 备份 避免映射volume后无法启动
RUN mkdir /thas && mkdir /thas/panel && cp -r /www/server/panel/data /thas/panel \
&& mkdir /thas/nginx && cp -r /www/server/nginx/conf /thas/nginx

COPY start.sh /data/start.sh
COPY stop.sh /data/stop.sh
COPY entry.sh /data/entry.sh

RUN chown root:root /data/*.sh && chmod 700 /data/*.sh

WORKDIR /data

EXPOSE 8888 888 80 443 21 3306 22

VOLUME /www/server/panel/data
VOLUME /www/server/panel/vhost
VOLUME /www/server/nginx/conf
VOLUME /www/server/apache/conf
VOLUME /www/wwwroot
VOLUME /www/backup

ENTRYPOINT ["/data/entry.sh"]



