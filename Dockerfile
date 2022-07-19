FROM alpine:edge

RUN apk update && \
    apk add --no-cache ca-certificates caddy tor wget libnss3 xz-utils && \
    wget -qO- https://github.com/klzgrad/naiveproxy/releases/download/v103.0.5060.53-3/naiveproxy-v103.0.5060.53-3-linux-x64.tar.xz | busybox tar -xf naiveproxy-v103.0.5060.53-3-linux-x64.tar.xz&& \
    chmod +x /naive && \
    rm -rf /var/cache/apk/*

ADD science.sh /science.sh
RUN chmod +x /science.sh

CMD /science.sh
