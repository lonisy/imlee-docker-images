Nginx 镜像
==========
镜像名: 

版本 V1.0
---------
更新时间: 


**配置**

容器时区
Asia/Shanghai

持久化配置
宿主机目录:容器目录
```yml

  - /host/etc/nginx/1.13.0/configure:/etc/nginx
  - /host/data:/docker-container/data
  
```

