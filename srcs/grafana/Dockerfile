
FROM alpine

# COPY    srcs/telegraf.conf ./
# COPY    srcs/run_serv.sh ./

RUN		apk add vim
ADD		srcs/datasources.yaml ./
ADD		srcs/dashboard.json ./
ADD		srcs/dashboard.yaml ./

RUN		mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

RUN		wget https://dl.grafana.com/oss/release/grafana-7.1.5.linux-amd64.tar.gz \
		&& tar -zxvf grafana-7.1.5.linux-amd64.tar.gz \
		&& mv grafana-7.1.5 grafana \
		&& mv grafana /root \
		&& mv /datasources.yaml /root/grafana/conf/provisioning/datasources \
		&& mv dashboard.yaml /root/grafana/conf/provisioning/dashboards \
		&& mv dashboard.json /root/grafana/conf/provisioning/dashboards

RUN		ln -s /root/grafana/bin/grafana-cli /usr/bin \
		&& ln -s /root/grafana/bin/grafana-server /usr/bin

COPY /srcs/run_serv.sh ./

EXPOSE 3000

CMD ["/bin/ash", "run_serv.sh"]
# CMD ["/bin/ash"]