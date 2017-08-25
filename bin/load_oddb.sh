#!/bin/bash
zcat /var/pg_dumps/pg_oddb.backup.gz | psql --user postgres
