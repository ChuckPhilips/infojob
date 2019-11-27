#!/bin/bash

for domain in infojob.com www.infojob.com infojob2.com www.infojob2.com; do
	echo "Generating new cert for ${domain}."
	openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=HR/ST=Zagrebacka/L=Zagreb/O=Infojob/CN=${domain}" -keyout "/tmp/${domain}.key"  -out "/tmp/${domain}.crt" 2>/dev/null
	cat "/tmp/${domain}.crt" "/tmp/${domain}.key" > /var/www/html/"${domain}.pem"
	rm "/tmp/${domain}.key" "/tmp/${domain}.crt"
done

echo 'Changes will be active in about 1 minute.'
