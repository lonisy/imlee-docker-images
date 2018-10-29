FROM php:7.0.30-fpm

MAINTAINER ImLee <lonisy@163.com>

COPY build.sh /root/build.sh

RUN sh /root/build.sh

# COPY php.ini /usr/local/etc/php/php.ini

# RUN sed -i -e "s/pdo_mysql.default_socket=/pdo_mysql.default_socket=\/var\/run\/mysqld\/mysqld.sock/" /usr/local/etc/php/php.ini \
#   && sed -i "s/mysqli.default_socket =/mysqli.default_socket=\/var\/run\/mysqld\/mysqld.sock/" /usr/local/etc/php/php.ini \
#   && sed -i "s/mysql.default_socket =/mysqli.default_socket=\/var\/run\/mysqld\/mysqld.sock/" /usr/local/etc/php/php.ini

WORKDIR /data
VOLUME ["/data"]

