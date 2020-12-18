# FROM php:7.2.8-fpm-alpine3.6
# FROM docker pull php:7.2.8-fpm-alpine3.6
FROM php:7.2.8-fpm-stretch
MAINTAINER ImLee <lonisy@163.com>
RUN cp "/etc/php7/php.ini" "$PHP_INI_DIR/php.ini"
# RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY build.sh /root/build.sh
RUN sh /root/build.sh
WORKDIR /data
VOLUME ["/data"]


# docker pull php:7.2.8-fpm-stretch
# docker pull php:7.2.8-fpm-alpine3.6
