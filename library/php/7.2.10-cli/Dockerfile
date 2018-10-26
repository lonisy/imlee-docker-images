FROM alpine:3.8

MAINTAINER ImLee <lonisy@163.com>

RUN echo "http://mirrors.ustc.edu.cn/alpine/v3.8/main" > /etc/apk/repositories && \
 echo "http://mirrors.ustc.edu.cn/alpine/v3.8/community" >> /etc/apk/repositories && \
 apk --update add \
     php7 \
     php7-cli \
     php7-bcmath \
     php7-dom \
     php7-ctype \
     php7-curl \
     php7-fileinfo \
     php7-fpm \
     php7-gd \
     php7-iconv \
     php7-intl \
     php7-json \
     php7-mbstring \
     php7-mcrypt \
     php7-mysqlnd \
     php7-opcache \
     php7-openssl \
     php7-pdo \
     php7-pdo_mysql \
     php7-pdo_pgsql \
     php7-pdo_sqlite \
     php7-phar \
     php7-posix \
     php7-simplexml \
     php7-session \
     php7-soap \
     php7-tokenizer \
     php7-xml \
     php7-xmlreader \
     php7-xmlwriter \
     php7-zip \
     php7-redis \
     curl \
 && rm -rf /var/cache/apk/*

COPY build.sh /root/build.sh

RUN sh /root/build.sh

WORKDIR /application

CMD ["/usr/bin/sh", "-c"]