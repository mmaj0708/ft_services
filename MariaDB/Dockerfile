
FROM alpine:latest

# install Mysql
RUN apk update && apk add openrc && apk add wget
RUN apk add mysql mysql-client

RUN openrc
RUN touch /run/openrc/softlevel

COPY srcs/setup.sh /.
COPY srcs/run_serv.sh /.
COPY srcs/create_database.sql /.
RUN /etc/init.d/mariadb setup
RUN /etc/init.d/mariadb restart

# RUN mysql -u root -p < create_database.sql
RUN sh setup.sh

CMD ["/bin/ash", "run_serv.sh"]
# CMD ["/bin/ash"]
