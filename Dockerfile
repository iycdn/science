FROM debian:latest

RUN apt update && \
    apt install unzip tor wget libnss3 xz-utils -y && \
    echo "deb [trusted=yes] https://apt.fury.io/caddy/ /" \ | tee -a /etc/apt/sources.list.d/caddy-fury.list && \
    apt update && \
    apt install caddy - y && \
    tar -zxvf caddy_2.5.2_linux_amd64.tar.gz -C /usr/local/bin caddy && \
    wget -qO- https://github.com/klzgrad/naiveproxy/releases/download/v103.0.5060.53-3/naiveproxy-v103.0.5060.53-3-linux-x64.tar.xz && \
    tar -xf naiveproxy-v103.0.5060.53-3-linux-x64.tar.xz && \
    chmod +x /naive 

ADD science.sh /science.sh
RUN chmod +x /science.sh

CMD /science.sh
