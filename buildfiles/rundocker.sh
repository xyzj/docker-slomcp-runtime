#!/bin/bash

basepath=/home/projname

sudo mkdir -p $basepath
sudo chmod ugo+rwx $basepath

mkdir -p $basepath/tmp
mkdir -p $basepath/asset-imgs
mkdir -p $basepath/luwak_linux
mkdir -p $basepath/html

docker run -itd \
	-p2095:80 \
	-p2096:443 \
	-p2097:6819 \
	-p2098:6828 \
    -p33810-33819:33810-33819 \
    -v$basepath/tmp:/tmp/ttt \
    -v$basepath/luwak_linux:/opt/bin \
    -v$basepath/asset-imgs:/opt/asset-imgs \
    -v$basepath/html:/var/www/html \
    xyzj/luwak-netcore:latest \
    /opt/bin/run.sh \
&& \
echo "The container will be ready soon"
