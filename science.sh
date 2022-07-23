#!/bin/sh

# configs
AUUID=9831667d-e2fc-4022-a7ab-5fb9e0f1ee71
CADDYIndexPage=https://raw.githubusercontent.com/iycdn/science/master/mikutap-master.zip
CONFIGCADDY=https://raw.githubusercontent.com/iycdn/science/master/Caddyfile
ParameterSSENCYPT=chacha20-ietf-poly1305
StoreFiles=https://raw.githubusercontent.com/iycdn/science/master/StoreFiles
#PORT=4433
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
echo -e "BBR启动成功！"
wget https://github.com/caddyserver/caddy/releases/download/v2.5.2/caddy_2.5.2_linux_amd64.tar.gz
tar -zxvf caddy_2.5.2_linux_amd64.tar.gz -C /usr/local/bin caddy
wget -qO- https://github.com/klzgrad/naiveproxy/releases/download/v103.0.5060.53-3/naiveproxy-v103.0.5060.53-3-linux-x64.tar.xz
tar -xf naiveproxy-v103.0.5060.53-3-linux-x64.tar.xz
chmod +x /naive 
mkdir -p /etc/caddy/ /usr/share/caddy && echo -e "User-agent: *\nDisallow: /" >/usr/share/caddy/robots.txt
wget $CADDYIndexPage -O /usr/share/caddy/index.html && unzip -qo /usr/share/caddy/index.html -d /usr/share/caddy/ && mv /usr/share/caddy/*/* /usr/share/caddy/
wget -qO- $CONFIGCADDY >/etc/caddy/Caddyfile

/naive --listen=socks://127.0.0.1:8080 &


