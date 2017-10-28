bWAPP docker

使用 Docker 部署的 bWAPP, build 后直接使用即可。系统基于 ubuntu 14.04 版本, 服务器采用 apache2 + mysql + php5 搭建。

Changelog

2017-01-05

添加 supervisor 服务监控
如何使用

创建 docker 镜像(image)
# 这里的 bwapp 就是镜像名称
$ docker build -t bwapp .
创建 docker 容器(container)
2.1 交互式

# 交互创建一个容器, 本容器 80 端口映射到宿主机的 8080 端口上
$ docker run -it --name bwapp_vul -p 0.0.0.0:8080:80 bwapp /bin/bash
$ /usr/bin/supervisord
2.2 后台运行

# 交互创建一个容器, 本容器 80 端口映射到宿主机的 8080 端口上
$ docker run -d --name bwapp_vul -p 0.0.0.0:8080:80 bwapp
配置说明

mysql 账号
root/bug
apache2 工作目录
/var/www/html/
bWAPP 账号
bee/bug