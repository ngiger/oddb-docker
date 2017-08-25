#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER yus;
    CREATE DATABASE yus;
    GRANT ALL PRIVILEGES ON DATABASE yus TO yus;
EOSQL
