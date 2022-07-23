FROM debian:latest
RUN apt update && \
    apt install unzip libnss3 xz-utils -y && \
ADD science.sh /science.sh
RUN chmod +x /science.sh
CMD /science.sh
