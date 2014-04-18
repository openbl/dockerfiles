#!/usr/bin/env bash
docker run -d -t openbl/postgresql -p 5432 -e 5432 -D /var/lib/postgresql/9.3/main -c config_file=/etc/postgresql/9.3/main/postgresql.conf
