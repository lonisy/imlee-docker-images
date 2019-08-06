FROM php:7.0.29-fpm
MAINTAINER ImLee <lonisy@163.com>
COPY php.ini /usr/local/etc/php/php.ini
COPY build.sh /root/build.sh
RUN sh /root/build.sh
WORKDIR /data
VOLUME ["/data"]

