# Container Nginx

FROM alpine:latest

# install nginx
RUN apk update && apk add nginx && apk add openrc && apk add wget
RUN apk add openssl
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
RUN mkdir -p /run/nginx
RUN openrc
RUN touch /run/openrc/softlevel

# # install php7
# RUN apk add php7 php7-fpm php7-opcache \
# php7-gd php7-mysqli php7-zlib php7-curl \
# php7-mbstring php7-json php7-session

COPY /srcs/nginx.conf /etc/nginx/
COPY /srcs/index.html /www
COPY /srcs/run_serv.sh /.
COPY /srcs/proxy_params /etc/nginx/

#ssl key
RUN openssl req -x509 -nodes -subj '/CN=localhost' -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt

ADD srcs/livenessprobe.sh .

EXPOSE 80
EXPOSE 443

CMD ["/bin/ash", "run_serv.sh"]
# CMD ["/bin/ash"]