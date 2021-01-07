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

COPY nginx.conf /etc/nginx/
COPY index.html /www/
COPY run_serv.sh /.
RUN openrc
RUN touch /run/openrc/softlevel
CMD ["/bin/ash", "run_serv.sh"]
# CMD ["/bin/ash"]