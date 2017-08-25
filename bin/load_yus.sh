#!/bin/bash
zcat /var/pg_dumps/pg_yus.backup.gz | psql --user postgres
