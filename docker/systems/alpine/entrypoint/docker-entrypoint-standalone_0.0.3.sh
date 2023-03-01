#!/usr/bin/env bash

set -e

trap stop SIGTERM SIGINT SIGQUIT SIGHUP ERR

. /docker-entrypoint.inc


function start()
{
    start_postgresql
    start_bacula_dir
    start_bacula_sd
    start_bacula_fd
    start_php_fpm
}

function stop()
{
    stop_php_fpm
    stop_bacula_fd
    stop_bacula_sd
    stop_bacula_dir
    stop_postgresql
}

### cintrol bacula config
if [ ! -f /etc/bacula/bacula-config.control ]; then
  tar xzf /bacula-dir.tgz --backup=simple --suffix=.before-control

  # Control file
  touch /etc/bacula/bacula-config.control
fi

### Control bacula storade 
if [ ! -f /var/lib/bacula/bacula-sd.control ]; then
  tar xzf /bacula-sd.tgz --backup=simple --suffix=.before-control

  # Control file
  touch /var/lib/bacula/bacula-sd.control
fi

### Control bacularis-app
if [ ! -f /var/www/bacularis/bacularis-app.control ]; then
  tar xzf /bacularis-app.tgz --backup=simple --suffix=.before-control

  # Control file
  touch /var/www/bacularis/bacularis-app.control
fi

start

exec "$@"
