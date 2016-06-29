#!/usr/bin/env bash

consul agent -config-dir /etc/consul.d/ -server&

until consul members | grep server
do
	sleep 3
  	echo "Waiting to conenct to Consul server..."
done

curl -X PUT -d all_global_consul http://localhost:8500/v1/kv/tiller/globals/all/should_be_overriden
curl -X PUT -d production_global_consul http://localhost:8500/v1/kv/tiller/globals/production/should_be_overriden
curl -X PUT -d development_global_consul http://localhost:8500/v1/kv/tiller/globals/development/should_be_overriden

curl -X PUT -d production_template_consul http://localhost:8500/v1/kv/tiller/values/production/test.erb/should_be_overriden
tiller -d -v -e $TILLER_ENV
pkill consul
exit 0