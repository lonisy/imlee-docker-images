FROM registry.cn-hongkong.aliyuncs.com/imlee/php-cli:7.2.10-cli

MAINTAINER ImLee <lonisy@163.com>
COPY build.sh /root/build.sh

RUN sh /root/build.sh
# COPY php.ini /etc/php7/conf.d/setting.ini

COPY service.sh /home/service.sh
RUN mkdir -p /data/code-deploy/logs
WORKDIR /data
VOLUME ["/data"]
CMD ["/home/service.sh"]

