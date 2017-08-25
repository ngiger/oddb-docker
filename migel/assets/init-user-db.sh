#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER migel;
    CREATE DATABASE migel;
    GRANT ALL PRIVILEGES ON DATABASE migel TO migel;
EOSQL
