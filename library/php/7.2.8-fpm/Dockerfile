FROM php:7.2.8-fpm-alpine3.6
MAINTAINER ImLee <lonisy@163.com>
# RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY build.sh /root/build.sh
RUN sh /root/build.sh
WORKDIR /data
VOLUME ["/data"]

