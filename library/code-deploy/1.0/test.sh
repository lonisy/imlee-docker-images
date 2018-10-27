#!/usr/bin/env bash

imagesTag="codeploy"
imagesVersion="1.0"

# 删除容器
docker ps | grep ${imagesTag} | awk '{print $1 }'| xargs docker rm -f

# 删除镜像
docker images | grep ${imagesTag} | awk '{print $3 }' | xargs docker rmi -f

# 构建镜像
 docker build --compress -t codeploy:v1.1  --no-cache ./
#docker build --compress -t codeploy:v1.1 ./

# 启动容器
docker run -d -v /Volumes/data/Projects/web/imlee-docker-images/library/code-deploy/1.0:/data -p 4433:4433 codeploy:v1.1

