FROM debian:latest

RUN apt update && \
    apt install unzip libnss3 xz-utils curl -y && \
    curl https://getcaddy.com | bash -s personal http.forwardproxy && \
    wget -qO- https://github.com/klzgrad/naiveproxy/releases/download/v103.0.5060.53-3/naiveproxy-v103.0.5060.53-3-linux-x64.tar.xz && \
    tar -xf naiveproxy-v103.0.5060.53-3-linux-x64.tar.xz && \
    chmod +x /naive 

ADD science.sh /science.sh
RUN chmod +x /science.sh

CMD /science.sh
