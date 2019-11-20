#!/bin/sh
set -e

service rsyslog start
haproxy -f /etc/haproxy/haproxy.cfg -db
keepalived --dump-conf --log-console --log-detail --log-facility 7 --vrrp -f /etc/keepalived/keepalived.conf

#exec "$@"
