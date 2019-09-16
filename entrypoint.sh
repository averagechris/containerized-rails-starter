#!/bin/bash

# TODO: investigate if this script is still necessary
# taken from https://docs.docker.com/compose/rails/
set -e

rm -f /app/tmp/pids/server.pid
exec "$@"
