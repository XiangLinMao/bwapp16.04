FROM ubuntu:16.04

MAINTAINER JackMao <j912944946@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update
RUN apt-get install -y software-properties-common
RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
RUN apt-get -y update
RUN apt-get -y install apache2 php5.6 php5.6-mysqlnd mysql-server wget unzip curl supervisor
RUN /etc/init.d/mysql start &&\
    mysql -e "grant all privileges on *.* to 'root'@'localhost' identified by 'bug';"&&\
    mysql -u root -pbug -e "show databases;"

# chang 
WORKDIR /var/www/html/

# copy supervisor configuration
COPY ./bwapp.conf /etc/supervisor/conf.d/bwapp.conf

# download bWAPP
RUN wget http://jaist.dl.sourceforge.net/project/bwapp/bWAPP/bWAPP_latest.zip && unzip bWAPP_latest.zip &&\
    rm /var/www/html/index.html

# install bWAPP
RUN /etc/init.d/mysql restart && /etc/init.d/apache2 restart &&\
  curl http://127.0.0.1/bWAPP/install.php?install=yes 1>/dev/null

EXPOSE 80

# start supervisord
CMD ["/usr/bin/supervisord"]