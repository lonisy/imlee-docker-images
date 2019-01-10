FROM php:7.1.25-fpm
MAINTAINER ImLee <lonisy@163.com>
COPY build.sh /root/build.sh
RUN sh /root/build.sh
WORKDIR /data
VOLUME ["/data"]