#!/bin/sh
set -e

#/usr/sbin/rsyslogd
#/usr/sbin/keepalived --dump-conf --log-console --log-detail --log-facility 7 --vrrp -f /etc/keepalived/keepalived.conf
#/usr/sbin/sshd
#/usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg -db
service rsyslog start
service haproxy start
service keepalived start
service ssh start

exec "$@"
