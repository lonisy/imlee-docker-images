FROM php:5.6-fpm

MAINTAINER ImLee <lonisy@163.com>

RUN docker-php-ext-install pdo pdo_mysql sockets

# 安装扩展
pecl install https://pecl.php.net/get/redis-3.1.3.tgz && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini
pecl install https://pecl.php.net/get/xdebug-2.5.5.tgz && echo "zend_extension=xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini

# COPY php.ini /usr/local/etc/php/

WORKDIR /data
VOLUME ["/data"]


