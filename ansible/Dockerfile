FROM ubuntu
 
USER root
 
RUN \
  apt-get update && \
  apt-get install -y software-properties-common && \
  apt-add-repository ppa:ansible/ansible && \
  apt-get update && \
  apt-get install -y --force-yes ansible less iputils-ping

COPY ansible.cfg /etc/ansible/ansible.cfg
COPY hosts /etc/ansible/hosts
COPY playbook.yml /tmp/playbook.yml
COPY ansible-key /root/.ssh/id_rsa
COPY ansible-key.pub /root/.ssh/id_rsa.pub

#RUN ssh-keygen -t rsa -b 4096 -N '' -f /root/.ssh/id_rsa
 
RUN mkdir /ansible
WORKDIR /ansible