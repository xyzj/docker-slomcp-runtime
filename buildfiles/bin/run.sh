#!/bin/bash

start-stop-daemon --stop -p /run/sslrenew.pid
sleep 1
start-stop-daemon --start -m -p /run/sslrenew.pid --background -d /opt/bin --exec /opt/bin/sslrenew
sleep 2

cp /opt/bin/default /etc/nginx/sites-available/default

service nginx stop
sleep 1
service nginx start
sleep 2

cd /opt/bin
./runext.py -y

/bin/bash