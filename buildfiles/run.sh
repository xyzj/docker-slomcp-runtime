#!/bin/bash

mkdir -p /opt/bin/conf/ca	# 创建证书保存目录

cp /opt/bin/conf/nginx-default /etc/nginx/sites-enabled/default # 更新nginx配置文件

service nginx stop # 重新启动nginx
sleep 1
service nginx start
sleep 1

cd /opt/bin
./luwakctl init luwak
./luwakctl start all -y # 调用启动业务服务的管理程序

/bin/bash # 防止启动后自动退出