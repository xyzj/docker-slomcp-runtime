#!/bin/bash

docker run -itd \
	-p2095:80 \
	-p2096:443 \
	-p2097:6819 \
	-p2098:6828 \
    -p33810-33819:33810-33819 \
    -v/tmp:/tmp/ttt \
    -v/home/luwak_exec:/opt/bin \
    -v/home/asset-imgs:/opt/asset-imgs \
    -v/home/html:/var/www/html \
    xyzj/luwak-runtime:latest \
    /opt/bin/run.sh

echo "The container will be ready soon"
