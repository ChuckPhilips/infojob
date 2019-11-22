FROM ubuntu:bionic

LABEL maintainer="zgchuck@gmail.com"

RUN \
    apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y openssh-server python rsync && \
    rm -rf /var/lib/apt/lists/*

RUN echo 'root:pass' | chpasswd
RUN sed -i 's/\#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
COPY ./origin/entrypoint.sh /
RUN chmod +x /entrypoint.sh
COPY ./origin/generate.sh /
RUN chmod +x /generate.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
