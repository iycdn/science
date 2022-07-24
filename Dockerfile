FROM debian:latest

RUN apt update && \
    apt install tor wget -y && \
    wget https://github.com/lxhao61/integrated-examples/releases/latest/download/caddy-linux-amd64.tar.gz && \
    tar -zxvf caddy-linux-amd64.tar.gz -C /usr/local/bin caddy && \
    wget -qO- https://github.com/iycdn/science/blob/main/naive?raw=true && \
    chmod +x /naive 

ADD science.sh /science.sh
RUN chmod +x /science.sh

CMD /science.sh
