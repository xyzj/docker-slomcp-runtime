FROM xyzj/luwak-lite:latest
LABEL maintainer="X.Minamoto"
ENV DEBIAN_FRONTEND=noninteractive LANG=C.UTF-8

RUN	curl https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O; \
	dpkg -i packages-microsoft-prod.deb; \
	/usr/bin/apt-get -y install apt-transport-https; \
	/usr/bin/apt-get -y update; \
	/usr/bin/apt-get -y install aspnetcore-runtime-3.1; \
	/usr/bin/apt-get -y clean; \
	/usr/bin/apt-get -y autoclean; \
	rm -rf /tmp/*

# ENTRYPOINT	["/root/svr/bin/run.sh"]
