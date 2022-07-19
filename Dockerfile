FROM debian:latest

RUN apt upfate && \
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list && \
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | apt-key add - && \
    apt update && \
    apt install caddy tor wget libnss3 xz-utils -y && \
    wget -qO- https://github.com/klzgrad/naiveproxy/releases/download/v103.0.5060.53-3/naiveproxy-v103.0.5060.53-3-linux-x64.tar.xz | busybox tar -xf naiveproxy-v103.0.5060.53-3-linux-x64.tar.xz&& \
    chmod +x /naive && \

ADD science.sh /science.sh
RUN chmod +x /science.sh

CMD /science.sh
