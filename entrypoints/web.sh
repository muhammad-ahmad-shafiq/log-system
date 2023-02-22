#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

echo " ----------> Running fluent-bit"
/opt/fluent-bit/bin/fluent-bit -c fluent-bit.config

echo " ----------> Running bundler"
bundle check || bundle install  --jobs 4
# echo " ----------> Running migrations"
# bundle exec rails db:migrate

echo " ----------> Running server"
bundle exec rails s -b 0.0.0.0 webrick > /dev/null
