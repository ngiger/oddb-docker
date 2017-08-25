#!/bin/bash
zcat /var/pg_dumps/pg_migel.backup.gz | psql --user postgres
