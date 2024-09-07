#!/bin/sh

# Wait for the database to be ready
# You might need to install 'wait-for-it' or a similar script if necessary
echo "Waiting for database to be ready..."
sleep 10

# Run migrations
echo "Running migrations..."
python manage.py migrate

# Start the server
exec "$@"