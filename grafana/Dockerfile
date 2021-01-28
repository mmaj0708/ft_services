FROM alpine

# COPY    srcs/telegraf.conf ./
# COPY    srcs/run_serv.sh ./

RUN		mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

RUN		wget https://dl.grafana.com/oss/release/grafana-7.1.5.linux-amd64.tar.gz \
		&& tar -zxvf grafana-7.1.5.linux-amd64.tar.gz \
		&& mv grafana-7.1.5 grafana 
		# && mv grafana /root \
		# && mv /root/datasources.yaml /root/grafana/conf/provisioning/datasources \
		# && mv /root/dashboard.yaml /root/grafana/conf/provisioning/dashboards \
		# && mv /root/dashboard.json /root/grafana/conf/provisioning/dashboards \
		# && apk add curl

# RUN		ln -s /root/grafana/bin/grafana-cli /usr/bin \
# 		&& ln -s /root/grafana/bin/grafana-server /usr/bin

# CMD ["/bin/ash", "run_serv.sh"]
CMD ["/bin/ash"]