#!/bin/sh

# configs
CADDYIndexPage=https://raw.githubusercontent.com/iycdn/science/master/mikutap-master.zip
CONFIGCADDY=https://raw.githubusercontent.com/iycdn/science/master/Caddyfile
StoreFiles=https://raw.githubusercontent.com/iycdn/science/master/StoreFiles
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
echo -e "BBR启动成功！"
mkdir -p /etc/caddy/ /usr/share/caddy && echo -e "User-agent: *\nDisallow: /" >/usr/share/caddy/robots.txt
wget $CADDYIndexPage -O /usr/share/caddy/index.html && unzip -qo /usr/share/caddy/index.html -d /usr/share/caddy/ && mv /usr/share/caddy/*/* /usr/share/caddy/
wget -qO- $CONFIGCADDY >/etc/caddy/Caddyfile

# start
tor &
/naive --listen=socks://127.0.0.1:8080 &

caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
