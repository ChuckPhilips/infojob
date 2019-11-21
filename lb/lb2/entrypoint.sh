#!/bin/sh
set -e

/usr/sbin/rsyslogd
/usr/sbin/keepalived --dump-conf --log-console --log-detail --log-facility 7 --vrrp -f /etc/keepalived/keepalived.conf
/usr/sbin/sshd -D
/usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg -db

exec "$@"
