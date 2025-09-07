#!/bin/bash

set -e

# Tail LocalStack logs
echo "Tailing LocalStack logs..."
localstack logs -f
