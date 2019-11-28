FROM ubuntu
 
USER root
 
RUN \
  apt-get update && \
  apt-get install -y software-properties-common && \
  apt-add-repository ppa:ansible/ansible && \
  apt-get update && \
  apt-get install -y --force-yes ansible less iputils-ping vim rsync

COPY ./ansible/ansible.cfg /etc/ansible/ansible.cfg
COPY ./ansible/hosts /etc/ansible/hosts
COPY ./ansible/ansible-key /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa
COPY ./ansible/ansible-key.pub /root/.ssh/id_rsa.pub
 
RUN mkdir /ansible
RUN mkdir /ansible/ssl
COPY ./ansible/get.yml /ansible/get.yml
COPY ./ansible/entrypoint.sh /
RUN chmod +x /entrypoint.sh
COPY ./ansible/root /var/spool/cron/crontabs/
RUN chmod 600 /var/spool/cron/crontabs/root
RUN chown root:crontab /var/spool/cron/crontabs/root
WORKDIR /ansible

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
