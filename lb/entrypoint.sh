#!/bin/sh
set -e

service rsyslog start
haproxy -f /etc/haproxy/haproxy.cfg -db

exec "$@"
