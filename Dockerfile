FROM ubuntu:16.04

MAINTAINER JackMao <j912944946@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update
RUN apt-get install -y software-properties-common
RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
RUN apt-get -y update
RUN apt-get -y install apache2

RUN apt-get -y update
RUN apt-get -y install php5.6
RUN apt-get -y php5-mysqlnd
# add source list
ADD sources.list /etc/apt/

# install apache2,because ubuntu16.04 default PHP install version is PHP7.0,
# so we need to del all the PHP pkg, before install PHP5.6 we need to install apache2

RUN apt-get -y update
RUN apt-get -y install mysql-server wget unzip curl supervisor

# 启动 mysql 并设置 root 密码
RUN /etc/init.d/mysql start &&\
    mysql -e "grant all privileges on *.* to 'root'@'localhost' identified by 'bug';"&&\
    mysql -u root -pbug -e "show databases;"

# 切换工作目录
WORKDIR /var/www/html/

# 拷贝监控服务配置
COPY ./bwapp.conf /etc/supervisor/conf.d/bwapp.conf

# 本地拷贝
#ADD ./bWAPP_latest.zip /var/www/html/bWAPP_latest.zip
#RUN unzip /var/www/html/bWAPP_latest.zip && rm /var/www/html/index.html

# 下载 bWAPP
RUN wget http://jaist.dl.sourceforge.net/project/bwapp/bWAPP/bWAPP_latest.zip && unzip bWAPP_latest.zip &&\
    rm /var/www/html/index.html

# 安装 bWAPP
RUN /etc/init.d/mysql restart && /etc/init.d/apache2 restart &&\
  curl http://127.0.0.1/bWAPP/install.php?install=yes 1>/dev/null

EXPOSE 80

# 启动容器后执行的命令
CMD ["/usr/bin/supervisord"]