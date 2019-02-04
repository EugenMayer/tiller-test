#!/usr/bin/env bash
echo "*********************************************************************************************** "
echo "*****************************************  FIRST TIME ***************************************** "
echo "*********************************************************************************************** "
echo
tiller -v -d --no-exec

echo "*********************************************************************************************** "
echo "***************************************** SECOND TIME ***************************************** "
echo "*********************************************************************************************** "
echo

tiller -v -d --no-exec

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