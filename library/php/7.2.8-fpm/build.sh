#!/usr/bin/env bash
apk update && apk upgrade
apk add --no-cache php7-pear php7-dev gcc musl-dev make bash re2c build-base

curl -fsSL https://github.com/edenhill/librdkafka/archive/v1.5.0.tar.gz -o librdkafka.tar.gz \
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

# 安装扩展
pecl channel-update pecl.php.net
pecl install https://pecl.php.net/get/redis-4.0.0.tgz
pecl install http://pecl.php.net/get/SeasLog-2.0.2.tgz
pecl install http://pecl.php.net/get/rdkafka-4.0.0.tgz


#pecl install https://pecl.php.net/get/imagick-3.4.3.tgz
#pecl install https://pecl.php.net/get/swoole-2.2.0.tgz
#pecl install https://pecl.php.net/get/xdebug-2.5.5.tgz
#pecl install https://pecl.php.net/get/mongodb-1.5.3.tgz
#pecl install yaf
pecl clear-cache
#/usr/local/bin/docker-php-ext-enable redis seaslog rdkafka imagick swoole xdebug mongodb yaf
/usr/local/bin/docker-php-ext-enable redis
/usr/local/bin/docker-php-ext-enable seaslog
/usr/local/bin/docker-php-ext-enable rdkafka


# 安装 php-composer
/usr/local/bin/php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && /usr/local/bin/php composer-setup.php --install-dir=/usr/bin --filename=composer && /usr/local/bin/php -r "unlink('composer-setup.php');"

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#apt-get autoclean && apt-get clean  && apt-get autoremove

#rm -rf /tmp/*

#apk add softName
#apk del softName


#$ git clone https://github.com/edenhill/librdkafka.git
#$ cd librdkafka
#$ ./configure
#$ make &amp;&amp; make install

#RUN apk update && apk upgrade
#RUN apk add --no-cache php7-pear php7-dev gcc musl-dev make
#RUN pecl install xdebug

#re2c的介绍：http://re2c.org/
#
#re2c的下载：http://sourceforge.net/projects/re2c/files/re2c/
#
#经确认，re2c可以提高性能，那就开始升级吧
#sudo apk add gcc musl-dev python-dev libffi-dev openssl-dev