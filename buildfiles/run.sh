#!/bin/bash

mkdir -p /opt/bin/conf/ca	# 创建证书保存目录

start-stop-daemon --stop -p /run/sslrenew.pid # 关闭旧的证书更新服务
cp /opt/bin/conf/nginx-default /etc/nginx/sites-enabled/default # 更新nginx配置文件
sleep 1

start-stop-daemon --start -m -p /run/sslrenew.pid --background -d /opt/bin --exec /opt/bin/sslrenew # 启动证书更新服务
sleep 1
nginx -s reload # 重新启动nginx
sleep 1

cd /opt/bin
./luwakctl start all -y # 调用启动业务服务的管理程序

/bin/bash # 防止启动后自动退出