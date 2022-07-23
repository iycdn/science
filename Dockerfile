FROM debian:latest
RUN apt update && \
    apt install wget unzip libnss3 xz-utils -y
ADD science.sh /science.sh
RUN chmod +x /science.sh
CMD /science.sh
