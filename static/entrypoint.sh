#!/bin/sh
set -e

service nginx start
service ssh start

exec "$@"
