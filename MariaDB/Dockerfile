
FROM alpine:latest

# install Mysql
RUN apk update && apk add openrc && apk add wget
RUN apk add mysql mysql-client

RUN openrc
RUN touch /run/openrc/softlevel

COPY srcs/setup.sh /.
COPY srcs/run_serv.sh /.
COPY srcs/create_database.sql /.
RUN sh setup.sh

# CMD ["/bin/ash", "run_serv.sh"]
CMD ["/bin/ash"]
