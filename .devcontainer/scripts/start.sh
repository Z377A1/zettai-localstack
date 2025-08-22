#!/bin/bash

set -e

# Set the LocalStack host environment variable
# 2025-08-22T16:23:02.334  WARN --- [  MainThread] localstack.deprecations    :
# LOCALSTACK_HOSTNAME is deprecated (since 2.0.0) 
# and will be removed in upcoming releases of LocalStack! 
# This configuration will be migrated to LOCALSTACK_HOST
export LOCALSTACK_HOSTNAME="$(hostname)"
# export LOCALSTACK_HOST=$LOCALSTACK_HOSTNAME

# Start localstack
localstack start -d

echo "Localstack started!"
