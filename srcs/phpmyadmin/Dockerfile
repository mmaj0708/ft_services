# Container with Phpmyadmin/Nginx integration

FROM alpine:latest

# install nginx
RUN apk update && apk add nginx && apk add openrc && apk add wget && apk add vim
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
RUN mkdir -p /run/nginx
RUN openrc
RUN touch /run/openrc/softlevel

# install php7
RUN apk add php7 php7-fpm php7-opcache php7-mbstring php7-session php7-common php7-iconv \
php7-zlib php7-json php7-gd php7-curl php7-xml php7-mysqli \
php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
php7-soap php7-xmlrpc php7-posix php7-mcrypt \
php7-gettext php7-ldap php7-ctype php7-dom php7-mysqli 

# # install PMA
# RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
# RUN tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
# RUN phpMyAdmin-5.0.2-all-languages.tar.gz
# RUN mv phpMyAdmin-5.0.2-all-languages phpmyadmin

COPY /srcs/nginx.conf /etc/nginx/
COPY /srcs/run_serv.sh /.
COPY /srcs/install.sh /.
COPY /srcs/index.html /www
COPY /srcs/test.php /www
COPY /srcs/config.inc.php ./

RUN sh install.sh

ADD srcs/livenessprobe.sh .

# EXPOSE 5000

CMD ["/bin/ash", "run_serv.sh"]
# CMD ["/bin/ash"]