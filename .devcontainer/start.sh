#!/bin/bash

set -e

# Run post start commands for the devcontainer
echo "Running post start commands..."

# Activate the python environment
echo "Activating the python environment..."
source .venv/bin/activate

# Start LocalStack
echo "Starting LocalStack..."
# Set the LocalStack host environment variable
# 2025-08-22T16:23:02.334  WARN --- [  MainThread] localstack.deprecations    :
# LOCALSTACK_HOSTNAME is deprecated (since 2.0.0) 
# and will be removed in upcoming releases of LocalStack! 
# This configuration will be migrated to LOCALSTACK_HOST
export LOCALSTACK_HOSTNAME="$(hostname)"
# export LOCALSTACK_HOST=$LOCALSTACK_HOSTNAME

localstack start -d
echo "LocalStack started!"

echo "Post start commands completed."
