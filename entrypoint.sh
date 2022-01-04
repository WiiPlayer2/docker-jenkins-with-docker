#!/bin/sh

if [ "$(id -u)" = "0" -a -e /var/run/docker.sock ]; then
  /fix-perms.sh -r -g docker /var/run/docker.sock
fi

# run process as the container user "jenkins" if currently root
if [ "$(id -u)" = "0" ]; then
  exec gosu jenkins "$@"
else
  exec "$@"
fi
