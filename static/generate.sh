#!/bin/bash

for domain in infojob.com infojob2.com infojob2.com www.infojob2.com; do
	openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=HR/ST=Zagrebacka/L=Zagreb/O=Infojob/CN=${domain}" -keyout "${domain}.key"  -out "${domain}.crt"
	cat "${domain}.crt" "${domain}.key" >> /var/www/html/"${domain}.pem"
	rm "${domain}.key" "${domain}.crt"
done
