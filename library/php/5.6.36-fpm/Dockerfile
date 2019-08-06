FROM php:5.6.36-fpm

MAINTAINER ImLee <lonisy@163.com>

RUN docker-php-ext-install pdo pdo_mysql sockets

RUN pecl install https://pecl.php.net/get/redis-3.1.3.tgz && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini
RUN pecl install https://pecl.php.net/get/xdebug-2.5.5.tgz && echo "zend_extension=xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini

WORKDIR /data
VOLUME ["/data"]

