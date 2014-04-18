#!/usr/bin/env bash

sysctl -w kernel.shmmax=17179869184
sysctl -w kernel.shmall=4194304

chown -R postgres:postgres /etc/postgresql
chown -R postgres:postgres /var/log/postgresql
chown -R postgres:postgres /usr/lib/postgresql

PG_BIN=/usr/lib/postgresql/9.3/bin
PG_DATA=/usr/lib/postgresql/9.3/main
PG_CONF=/usr/lib/postgresql/9.3/main/postgresql.conf

su postgres -c "${PG_BIN}/initdb -D ${PG_DATA} -E UTF8"
# su postgres -c "${PG_BIN}/postgres --single -D ${PG_DATA} -c config_file=${PG_CONF}" <<< "CREATE USER postgres WITH SUPERUSER PASSWORD 'postgres';"
