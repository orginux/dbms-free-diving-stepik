#!/bin/bash
set -e

TASK=${1}

if [ -z "$TASK" ]
then
    echo "The task number is required"
    echo "Example:"
    echo -e "\tmake homework TASK=4-8"
    exit 1
fi

while ! pg_isready
do
    echo "$(date) - waiting for database to start"
    sleep 2
done

psql -U postgres -f /tmp/home-work/task${TASK}/schema.sql
