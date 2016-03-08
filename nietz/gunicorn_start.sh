#!/bin/bash

NAME="app"                                  # Name of the application
DJANGODIR=/opt/app/python/c-nietz/nietz/nietz             # Django project directory
SOCKFILE=/opt/app/python/c-nietz/run/gunicorn.sock  # we will communicte using this unix socket
USER=root                                        # the user to run as
GROUP=root                                     # the group to run as
NUM_WORKERS=2                                     # how many worker processes should Gunicorn spawn
DJANGO_SETTINGS_MODULE=nietz.settings             # which settings file should Django use
DJANGO_WSGI_MODULE=nietz.wsgi                     # WSGI module name

echo "Starting $NAME as `whoami`"

# Activate the virtual environment
cd $DJANGODIR
source ../../env/nietz-env/bin/activate
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$DJANGODIR:$PYTHONPATH

# Create the run directory if it doesn't exist
RUNDIR=$(dirname $SOCKFILE)
test -d $RUNDIR || mkdir -p $RUNDIR

# Start your Django Unicorn
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)
exec ../../env/nietz-env/bin/gunicorn ${DJANGO_WSGI_MODULE}:application \
  --name $NAME \
  --workers $NUM_WORKERS \
  --user=$USER --group=$GROUP \
  --bind=unix:$SOCKFILE \
  --log-level=debug \
  --log-file=-
