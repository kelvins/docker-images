#!/bin/bash
echo "Upgrading Mlflow database..."
mlflow db upgrade $BACKEND_STORE_URI
exec "$@"
