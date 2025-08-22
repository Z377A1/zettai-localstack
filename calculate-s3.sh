#!/bin/bash

# Calculate S3 Object Storage costs for Hetzner vs Cloudflare R2

set -e

source .venv/bin/activate
python3 docs/s3/calculate.py
