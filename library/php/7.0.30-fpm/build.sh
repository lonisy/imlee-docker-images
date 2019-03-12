#!/usr/bin/env bash
apt-get update --assume-yes && apt-get install -y libmagickwand-dev libmagickcore-dev
apt-get install -y libicu-dev libpq-dev
apt-get install -y libevent-dev libmemcached-dev libmemcached
apt-get install -y zip unzip git rsync
apt install librdkafka-dev

/usr/local/bin/docker-php-ext-install intl mysqli pdo_mysql pdo_pgsql pgsql shmop opcache sockets
/usr/local/bin/docker-php-ext-configure gd \
        --with-gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && /usr/local/bin/docker-php-ext-install gd \
    && /usr/local/bin/docker-php-ext-enable gd \
    && /usr/local/bin/docker-php-ext-install calendar zip pcntl

# swoole xdebug imagick redis memcached sockets opcache gd pdo_pgsql pgsql rsync

# 安装扩展
pecl install https://pecl.php.net/get/redis-3.1.3.tgz && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini
pecl install http://pecl.php.net/get/SeasLog-2.0.2.tgz && echo "extension=seaslog.so" > /usr/local/etc/php/conf.d/seaslog.ini
#pecl install http://pecl.php.net/get/xdebug-2.5.5.tgz && echo "zend_extension=xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini
pecl install http://pecl.php.net/get/rdkafka-3.0.4.tgz && echo "extension=rdkafka.so" > /usr/local/etc/php/conf.d/rdkafka.ini


# 安装 php-composer
/usr/local/bin/php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && /usr/local/bin/php composer-setup.php --install-dir=/usr/bin --filename=composer && /usr/local/bin/php -r "unlink('composer-setup.php');"

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

apt-get autoclean && apt-get clean  && apt-get autoremove

rm -rf /tmp/*