#!/bin/bash
# add perms for execution file docker-entrypoint.sh
# sudo chmod u+x docker-entrypoint.sh
python manage.py migrate                  # Apply database migrations
# Start Gunicorn processes
echo Starting server
  if [ "$DEBUG" = "1" ]; then
    exec uvicorn todo.asgi:application \
      --log-level=info --host=0.0.0.0 --port=8080 \
      --workers 1
  else
    python manage.py runserver 0.0.0.0:8000
  fi