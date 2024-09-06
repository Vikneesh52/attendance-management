#!/bin/sh

echo "Waiting for database to be ready..."

while ! nc -z db_host 5432; do
  echo "Waiting for the database to be available..."
  sleep 1
done

echo "Database is ready!"

echo "Running migrations..."
python manage.py migrate

exec "$@"