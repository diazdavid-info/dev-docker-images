#!/bin/sh
set -e

echo "STARTING"



# Apache gets grumpy about PID files pre-existing
rm -f /usr/local/apache2/logs/httpd.pid

exec httpd -DFOREGROUND "$@"
