#!/usr/bin/env bash
apt-get update --assume-yes && apt-get install -y libmagickwand-dev libmagickcore-dev
apt-get install -y libicu-dev libpq-dev
apt-get install -y libevent-dev libmemcached-dev libmemcached
apt-get install -y zip unzip git rsync openssl openssl-devel wget inetutils-ping iputils-ping
apt-get install -y autoconf pkg-config libssl-dev

# apt install -y librdkafka-dev
curl -fsSL https://github.com/edenhill/librdkafka/archive/v1.0.0.tar.gz -o librdkafka.tar.gz \
    && mkdir -p librdkafka \
    && tar -zxf librdkafka.tar.gz -C librdkafka --strip-components=1 \
    && rm librdkafka.tar.gz \
    && ( \
         cd librdkafka \
         && ./configure \
         && make -j$(nproc) \
         && make install \
     ) \
    && rm -r librdkafka

/usr/local/bin/docker-php-ext-install intl mysqli pdo_mysql pdo_pgsql pgsql shmop opcache sockets calendar zip pcntl
/usr/local/bin/docker-php-ext-configure gd \
        --with-gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/

# swoole xdebug imagick redis memcached sockets opcache gd pdo_pgsql pgsql rsync

# 安装扩展
pecl install https://pecl.php.net/get/redis-3.1.3.tgz
pecl install http://pecl.php.net/get/SeasLog-2.0.2.tgz
pecl install http://pecl.php.net/get/rdkafka-3.0.5.tgz
pecl install https://pecl.php.net/get/imagick-3.4.3.tgz
pecl install https://pecl.php.net/get/swoole-2.2.0.tgz
pecl install https://pecl.php.net/get/xdebug-2.5.5.tgz
pecl install https://pecl.php.net/get/mongodb-1.5.3.tgz
pecl install yaf
pecl clear-cache
/usr/local/bin/docker-php-ext-enable redis seaslog rdkafka imagick swoole xdebug mongodb yaf



# 安装 php-composer
/usr/local/bin/php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && /usr/local/bin/php composer-setup.php --install-dir=/usr/bin --filename=composer && /usr/local/bin/php -r "unlink('composer-setup.php');"

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

apt-get autoclean && apt-get clean && apt-get autoremove

rm -rf /tmp/*

echo "slowlog=/data/logs/php-slow.log" >> /usr/local/etc/php-fpm.d/zz-docker.conf
echo "request_slowlog_timeout=1s" >> /usr/local/etc/php-fpm.d/zz-docker.conf

