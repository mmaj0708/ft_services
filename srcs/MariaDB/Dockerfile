
FROM alpine:latest

# install Mysql
RUN apk update && apk add openrc && apk add wget
RUN apk add mysql mysql-client

# RUN openrc
# RUN touch /run/openrc/softlevel
# RUN adduser -D -g 'www' www

# RUN mkdir backup_mysql
# RUN chmod -R 755 backup_mysql
# RUN chown -R www:www backup_mysql
RUN sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf

COPY srcs/setup.sh /.
COPY srcs/run_serv.sh /.
COPY srcs/create_database.sql /.
ADD srcs/wordpress_save.sql .

EXPOSE 3306

ADD  srcs/livenessprobe.sh .

CMD ["/bin/ash", "run_serv.sh"]
# CMD ["/bin/ash"]
