#!/bin/sh
set -e

#service rsyslog start
/usr/sbin/rsyslogd
/usr/sbin/keepalived --dump-conf --log-console --log-detail --log-facility 7 --vrrp -f /etc/keepalived/keepalived.conf
#/usr/sbin/rsyslogd -n && \
#service keepalived start
/usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg -db
#service haproxy start

#exec "$@"
