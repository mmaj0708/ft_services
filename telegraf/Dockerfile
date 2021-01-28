FROM alpine

COPY    srcs/telegraf.conf ./
COPY    srcs/run_serv.sh ./

RUN		wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.2_linux_amd64.tar.gz \
		&& tar -zxf telegraf-1.15.2_linux_amd64.tar.gz \
		&& mv telegraf-1.15.2/ telegraf  \
        rm telegraf-1.15.2_linux_amd64.tar.gz

RUN     cp -rf /telegraf/usr/* /usr \
		&& cp -rf /telegraf/etc/* /etc

# CMD ["/bin/ash", "run_serv.sh"]
CMD ["/bin/ash"]