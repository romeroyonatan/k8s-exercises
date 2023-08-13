#!/bin/bash -
set -euo pipefail

# Read password from file and append it to the DATABASE_URL env variable
if [ -n "$DATABASE_PASSWORD_FILE" -a -f "$DATABASE_PASSWORD_FILE" ]; then
    DATABASE_PASSWORD=$(cat "$DATABASE_PASSWORD_FILE")
    DATABASE_URL=$(echo "$DATABASE_URL" | sed "s/@/:$DATABASE_PASSWORD@/")
    export DATABASE_URL
fi
exec "$@"
