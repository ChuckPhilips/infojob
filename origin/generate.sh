#!/bin/bash

read -p "Enter domain name: [infojob.com]: " domain
domain=${domain:-infojob.com}

openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=HR/ST=Zagrebacka/L=Zagreb/O=Infojob/CN=${domain}" -keyout "www.infojob.com.key"  -out "www.infojob.com.crt"
cat www.infojob.com.crt www.infojob.com.key > www.infojob.com.pem

