#!/bin/sh -x
#Roda no RAILS_ROOT
sunspot-solr start
resque-web
redis-server &
QUEUE=* VERBOSE=1 rake resque:work
