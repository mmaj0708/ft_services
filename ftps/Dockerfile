FROM alpine

# COPY    srcs/telegraf.conf ./
# COPY    srcs/run_serv.sh ./

RUN		apk add vim && apk add openrc && apk add vsftpd

RUN     rm /etc/vsftpd/vsftpd.conf
COPY    srcs/vsftpd.conf /etc/vsftpd/

RUN openrc
RUN touch /run/openrc/softlevel

EXPOSE 21

# CMD ["/bin/ash", "run_serv.sh"]
CMD ["/bin/ash"]