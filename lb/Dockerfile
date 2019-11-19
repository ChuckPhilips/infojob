FROM ubuntu:bionic

LABEL maintainer="zgchuck@gmail.com"

RUN \
# install packages
    apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y vim inetutils-ping iproute2 curl rsyslog haproxy less && \
    rm -rf /var/lib/apt/lists/* && \
# syslog settings
    sed -i 's/^\(module.*imklog.*\)/### \1/g' /etc/rsyslog.conf
    #cp -r /tmp/samples/keepalived/* /etc/keepalived && \

COPY ./entrypoint.sh /
COPY ./ssl/ /etc/ssl
COPY ./haproxy.cfg /etc/haproxy/

RUN chmod +x /entrypoint.sh
RUN mkdir /run/haproxy
RUN chmod 777 /run/haproxy
RUN service haproxy stop

EXPOSE 8080 8443 8090

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash"]
