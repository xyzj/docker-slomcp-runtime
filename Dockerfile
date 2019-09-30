FROM ubuntu:latest
MAINTAINER      X.Minamoto "xuyuan8720@189.cn"

ENV 			DEBIAN_FRONTEND noninteractive

COPY		buildfiles /root/

EXPOSE		10000-10020

RUN			/bin/echo 'root:administratorishere' |chpasswd;useradd xy;/bin/echo 'xy:iamlegal' |chpasswd; \
	/usr/bin/apt-get -y update; \
	/usr/bin/apt-get -y full-upgrade; \
	/usr/bin/apt-get -y install apt-utils; \
	/usr/bin/apt-get -y autoremove; \
	/usr/bin/apt-get -y install ssh net-tools nano tzdata nodejs npm nginx; \
	wget -q https://packages.microsoft.com/config/ubuntu/18.10/packages-microsoft-prod.deb -O /tmp/packages-microsoft-prod.deb; \
	dpkg -i /tmp/packages-microsoft-prod.deb; \
	/usr/bin/apt-get -y install apt-transport-https; \
	/usr/bin/apt-get -y update; \
	/usr/bin/apt-get -y install aspnetcore-runtime-2.2 dotnet-sdk-2.2; \
	/usr/bin/apt-get -y clean; \
	/usr/bin/apt-get -y autoclean; \
	rm -rf /tmp/*; \
	\
	ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \
	echo "Asia/Shanghai" > /etc/timezone; \
	dpkg-reconfigure -f noninteractive tzdata; \
	/bin/echo "net.ipv4.ip_forward=1">>/etc/sysctl.conf; \
	/bin/echo 'Port 10022' >> /etc/ssh/sshd_config; \
	/bin/echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config; \
	/bin/echo 'export PATH=$PATH:/root/svr'>> /root/.bashrc; \
	/bin/echo 'export PATH=$PATH:/root/svr/bin'>> /root/.bashrc; \
	chown -R root:root /root

# CMD			/usr/sbin/sshd -D

ENTRYPOINT	["/root/svr/bin/run.sh"]
