#!/bin/bash

read -p "Enter domain name: [infojob.com]: " domain
domain=${domain:-infojob.com}

openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=HR/ST=Zagrebacka/L=Zagreb/O=Infojob/CN=${domain}" -keyout "www.${domain}.key"  -out "www.${domain}.crt"
cat "www.${domain}.crt" "www.${domain}.key" >> /tmp/"www.${domain}.pem"
rm "www.${domain}.key" "www.${domain}.crt"

docker container exec -ti infojob_ansible_1 ansible-playbook /tmp/sync.yml
