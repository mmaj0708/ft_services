# Container with Wordpress/Nginx integration

FROM alpine:latest

# install nginx
RUN apk update && apk add nginx && apk add openrc && apk add wget
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
RUN mkdir -p /run/nginx
RUN openrc
RUN touch /run/openrc/softlevel

# install php7
RUN apk add php7 php7-fpm php7-opcache \
php7-gd php7-mysqli php7-zlib php7-curl \
php7-mbstring php7-json php7-session

# install wordpress
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN mv wordpress /www
RUN rm latest.tar.gz

COPY /srcs/nginx.conf /etc/nginx/
COPY /srcs/index.html /www
COPY /srcs/run_serv.sh /.
COPY /srcs/test.php /www

EXPOSE 5050

CMD ["/bin/ash", "run_serv.sh"]
# CMD ["/bin/ash"]