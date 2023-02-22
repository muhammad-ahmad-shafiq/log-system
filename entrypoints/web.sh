#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# echo " ----------> Running migrations"
# bundle exec rails db:migrate

echo " ----------> Running fluent-bit"
/opt/fluent-bit/bin/fluent-bit -c fluent-bit.config
echo " ----------> Running server"
bundle exec rails s -b 0.0.0.0 webrick > /dev/null
