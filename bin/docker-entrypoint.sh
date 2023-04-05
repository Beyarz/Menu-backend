#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# rake searchkick:reindex CLASS=Menu
rails server --binding=0.0.0.0
