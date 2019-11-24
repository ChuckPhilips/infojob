FROM ubuntu

LABEL maintainer="zgchuck@gmail.com"


USER root

RUN \
# install packages
    apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y vim less openssh-server nginx python openssl && \
    rm -rf /var/lib/apt/lists/*

COPY ./static/entrypoint.sh /
RUN chmod +x /entrypoint.sh
COPY ./static/index.html /usr/share/nginx/html/
COPY ./static/generate.sh /generate.sh
RUN chmod +x ./generate.sh


RUN mkdir -p /root/.ssh
RUN touch /root/.ssh/authorized_keys
COPY ./ansible-key.pub /tmp
RUN cat /tmp/ansible-key.pub >> /root/.ssh/authorized_keys
RUN rm /tmp/ansible-key.pub

EXPOSE 22 80 443

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
