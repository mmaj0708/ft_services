# Container with Wordpress/Nginx integration

FROM alpine:latest

# install nginx
RUN apk update && apk add nginx && apk add openrc
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
RUN mkdir -p /run/nginx
RUN openrc
RUN touch /run/openrc/softlevel

# install php7
RUN apk add php7 php7-fpm php7-opcache
# RUN add php7-gd php7-mysqli php7-zlib php7-curl #not necessarily useful


COPY /srcs/nginx.conf /etc/nginx/
COPY /srcs/index.html /www/
COPY /srcs/run_serv.sh /.
# CMD ["/bin/ash", "run_serv.sh"]
CMD ["/bin/ash"]