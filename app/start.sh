#!/bin/sh -ex

(rake db:setup 2> /dev/nul || true)
rake db:migrate && rake db:seed
rm -f ./tmp/pids/server.pid
rails server
