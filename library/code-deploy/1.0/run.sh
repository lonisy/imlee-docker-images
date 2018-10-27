#!/usr/bin/env bash
# 更新镜像
docker pull registry.cn-hongkong.aliyuncs.com/imlee/code-deploy:v1.0.0
#
# 删除容器
docker ps | grep 'code-deploy' | awk '{print $1 }'| xargs docker rm -f
#
# 启动容器
docker run -d -v /data:/data -v /root/.ssh:/root/.ssh:ro -p 4433:4433 registry.cn-hongkong.aliyuncs.com/imlee/code-deploy:v1.0.0
#
#
docker ps | grep 'code-deploy' | awk '{print $1 }'| xargs docker logs -f