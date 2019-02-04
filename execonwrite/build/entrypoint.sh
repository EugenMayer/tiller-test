#!/usr/bin/env bash

if [ "$use_develop" = "true" ]; then
  echo "------------ -> using tiller from source tiller"
  cd /tiller_source
  git branch
  gem install ./tiller*.gem
else
  echo "------------ -> using stable tiller"
  gem install tiller
fi

# running tiller the first time, this should trigger exec, but due to --no-exec it should not
echo "*********************************************************************************************** "
echo "*****************************************  FIRST TIME ***************************************** "
echo "*********************************************************************************************** "
echo
tiller -v -d --no-exec

# since we run tiller the second time, we have no changes for sure. Still, we are running --no-exec still
# so exec should not be triggered out of
echo "*********************************************************************************************** "
echo "***************************************** SECOND TIME ***************************************** "
echo "*********************************************************************************************** "
echo

tiller -v -d --no-exec

# this case should not trigger any exec also, since we run the same templates without changing any dynamic values
echo "************************************************************************************************** "
echo "***************************************** WITHOUT NO-EXEC **************************************** "
echo "************************************************************************************************** "
echo

tiller -v -d

shutdown ()
{
  echo "shutdown"
  exit 0;
}

# see https://intranet.kw.kontextwork.com/infrastruktur/dokument/docker-compose-docker-shell-tricks
trap shutdown INT TERM
echo "Started and keep running doing nothing"
tail -f /dev/null &
wait