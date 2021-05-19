FROM xyzj/luwak-lite:latest
LABEL maintainer="X.Minamoto"
ENV DEBIAN_FRONTEND=noninteractive LANG=C.UTF-8

RUN	/usr/bin/apt-get -y install nginx; \
	/usr/bin/apt-get -y update; \
	/usr/bin/apt-get -y clean; \
	/usr/bin/apt-get -y autoclean; \
	rm -rf /tmp/*

COPY buildfiles /opt/
COPY aspnetcore-runtime-3.1.15-linux-x64.tar.gz /opt/

RUN DOTNET_FILE=/opt/aspnetcore-runtime-3.1.15-linux-x64.tar.gz; \
	export DOTNET_ROOT=/opt/dotnet; \
	mkdir -p "$DOTNET_ROOT" && tar zxf "$DOTNET_FILE" -C "$DOTNET_ROOT"; \
	export PATH=$PATH:$DOTNET_ROOT; \
	echo 'export DOTNET_ROOT=/opt/dotnet' >> /root/.bashrc; \
	echo 'export PATH=$PATH:$DOTNET_ROOT' >> /root/.bashrc
