#!/bin/sh

if [ "DATABASE" = "postgres" ]
then
  echo "Waiting for Postgres..."
  
  while ! nc -z $SQL_HOST $SQL_PORT; do
    sleep 0.1
  done
  
  echo "PostgresSQL started"
fi

# Commented so they don't run everytime docker (re-)start. #
# python manage.py flush --no-input
# python manage.py migrate

exec "$@"
