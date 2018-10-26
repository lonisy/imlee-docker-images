apk update
apk upgrade
apk add git php-pear autoconf build-base linux-headers libaio-dev php7-dev libevent-dev

rm -rf /tmp/* \
    && rm -rf /var/cache/apk/* \
    && apk del php-pear libaio-dev php7-dev autoconf build-base linux-headers