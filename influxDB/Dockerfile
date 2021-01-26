
FROM alpine

RUN apk update && apk add openrc && apk add wget
RUN openrc
RUN touch /run/openrc/softlevel

EXPOSE 8086

# CMD ["/bin/ash", "run_serv.sh"]
CMD ["/bin/ash"]