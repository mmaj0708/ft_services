
FROM alpine:latest

# install Mysql
RUN apk update && apk add openrc && apk add wget
RUN apk add mysql mysql-client

RUN openrc
RUN touch /run/openrc/softlevel
RUN adduser -D -g 'www' www

RUN mkdir backup_mysql
RUN chmod -R 755 backup_mysql
RUN chown -R www:www backup_mysql

COPY srcs/setup.sh /.
COPY srcs/run_serv.sh /.
COPY srcs/create_database.sql /.
RUN /etc/init.d/mariadb setup
RUN /etc/init.d/mariadb restart

EXPOSE 3306

# RUN mysql -u root -p < create_database.sql
RUN sh setup.sh

CMD ["/bin/ash", "run_serv.sh"]
# CMD ["/bin/ash"]
