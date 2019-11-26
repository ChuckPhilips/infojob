#!/bin/sh
set -e

echo "<h1>Greeting from $HOSTNAME</h1>" > /usr/share/nginx/html/healthz.html
echo "<h1>Greeting from $HOSTNAME</h1>" > /usr/share/nginx/html/index.html
nginx -g 'daemon off;'

exec "$@"
