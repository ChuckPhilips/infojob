FROM ubuntu:bionic

LABEL maintainer="zgchuck@gmail.com"

RUN \
    apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y vim inetutils-ping iproute2 curl rsyslog haproxy less keepalived && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i 's/^\(module.*imklog.*\)/### \1/g' /etc/rsyslog.conf

#COPY ./ssl/ /etc/ssl
COPY ./haproxy.cfg /etc/haproxy/
COPY ./keepalived.conf /etc/keepalived/
COPY ./entrypoint.sh /

RUN chmod +x /entrypoint.sh
RUN mkdir /run/haproxy
RUN chown haproxy:haproxy /run/haproxy
RUN chmod 2775 /run/haproxy

EXPOSE 8080 8443 8090

ENTRYPOINT ["/entrypoint.sh"]
