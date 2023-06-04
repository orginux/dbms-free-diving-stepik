#!/bin/bash
set -e

while ! pg_isready 
do
    echo "$(date) - waiting for database to start"
    sleep 2
done

psql -U postgres -f /tmp/HW2Task2/task2-public.sql
