FROM debian:latest

RUN apt update && \
    apt install unzip libnss3 xz-utils -y && \
    wget https://github.com/caddyserver/caddy/releases/download/v2.5.2/caddy_2.5.2_linux_amd64.tar.gz && \
    tar -zxvf caddy_2.5.2_linux_amd64.tar.gz -C /usr/local/bin caddy && \
    wget -qO- https://github.com/klzgrad/naiveproxy/releases/download/v103.0.5060.53-3/naiveproxy-v103.0.5060.53-3-linux-x64.tar.xz && \
    tar -xf naiveproxy-v103.0.5060.53-3-linux-x64.tar.xz && \
    chmod +x /naive 

ADD science.sh /science.sh
RUN chmod +x /science.sh

CMD /science.sh
