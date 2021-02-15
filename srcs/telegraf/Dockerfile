FROM alpine

ADD    srcs/telegraf.conf ./
ADD    srcs/run_serv.sh ./

RUN		wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.2_linux_amd64.tar.gz \
		&& tar -zxf telegraf-1.15.2_linux_amd64.tar.gz \
		&& mv telegraf-1.15.2/ telegraf  \
        && rm telegraf-1.15.2_linux_amd64.tar.gz

RUN     cp -rf /telegraf/usr/* /usr \
		&& cp -rf /telegraf/etc/* /etc

RUN		mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

EXPOSE 8125

CMD ["/bin/ash", "run_serv.sh"]
# CMD ["/bin/ash"]