FROM ubuntu:bionic

LABEL maintainer="zgchuck@gmail.com"

RUN \
    apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y vim inetutils-ping iproute2 curl rsyslog haproxy less keepalived python openssh-server rsync && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i 's/^\(module.*imklog.*\)/### \1/g' /etc/rsyslog.conf

RUN mkdir /etc/haproxy/ssl
RUN chown haproxy:haproxy /etc/haproxy/ssl
COPY ./lb/ssl/my-crt-key.pem /etc/haproxy/ssl/my-crt-key.pem
RUN mkdir -p /root/.ssh
RUN touch /root/.ssh/authorized_keys
COPY ./ansible-key.pub /tmp
RUN cat /tmp/ansible-key.pub >> /root/.ssh/authorized_keys
RUN rm /tmp/ansible-key.pub

COPY ./lb/haproxy.cfg /etc/haproxy/
COPY ./lb/lb2/keepalived.conf /etc/keepalived/
COPY ./lb/entrypoint.sh /

RUN chmod +x /entrypoint.sh
#RUN mkdir /run/haproxy
#RUN chown haproxy:haproxy /run/haproxy
#RUN chmod 2775 /run/haproxy
RUN echo 'root:pass' | chpasswd
RUN sed -i 's/\#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN mkdir /var/run/sshd

EXPOSE 22 8080 8443 8090

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
