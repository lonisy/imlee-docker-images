FROM php:5.6-fpm
MAINTAINER ImLee <lonisy@163.com>
COPY build.sh /root/build.sh
RUN sh /root/build.sh
# COPY php.ini /usr/local/etc/php/
WORKDIR /data
VOLUME ["/data"]


