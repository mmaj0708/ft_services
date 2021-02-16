
FROM alpine

RUN apk update && apk add openrc && apk add wget
RUN openrc
RUN touch /run/openrc/softlevel

COPY srcs/run_serv.sh ./

RUN apk add influxdb gettext

# influx << EOF
# CREATE USER admin WITH PASSWORD '$INFLUX_ADM_PASS' WITH ALL PRIVILEGES;
# CREATE DATABASE telegraf;
# CREATE USER user_telegraf WITH PASSWORD '$INFLUX_TELE_PASS';
# GRANT ALL ON telegraf TO user_telegraf;
# EOF

EXPOSE 8086

ADD srcs/livenessprobe.sh .

CMD ["/bin/ash", "run_serv.sh"]
# CMD ["/bin/ash"]