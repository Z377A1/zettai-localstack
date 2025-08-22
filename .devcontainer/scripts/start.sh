#!/bin/bash

set -e

# Set the LocalStack hostname environment variable
export LOCALSTACK_HOSTNAME="$(hostname)"

# Start localstack
localstack start -d

echo "Localstack started!"
