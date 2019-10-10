# docker-bt-panel
docker-bt-panel

基于centos7制作的宝塔面板docker版

start with:
```
docker run -d --restart always --name bt-panel \
-e PASSWORD=YOUR_PASSWORD -e USERNAME=YOUR_USERNAME \
-p 8888:8888 -p 80:80 -p 443:443 \
-v bt_panel_data:/www/server/panel/data \
-v bt_panel_vhost:/www/server/panel/vhost \
-v bt_nginx_conf:/www/server/nginx/conf \
-v bt_apache_conf:/www/server/apache/conf \
-v bt_wwwroot:/www/wwwroot \
-v bt_backup:/www/backup \
thas/docker-bt-panel
```
