#!/bin/bash
set -e

TASK=${1}

while ! pg_isready
do
    echo "$(date) - waiting for database to start"
    sleep 2
done

psql -U postgres -f /tmp/home-work/task${TASK}/schema.sql
