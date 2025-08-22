#!/bin/bash

# Calculate S3 Object Storage costs for Hetzner vs Cloudflare R2

set -e

BUCKET_NAME="localstack"

awslocal s3api create-bucket --bucket $BUCKET_NAME
awslocal s3api put-bucket-policy --bucket $BUCKET_NAME --policy file://docs/s3/bucket_policy.json

# awslocal s3 sync ./docs/s3/data s3://$BUCKET_NAME
