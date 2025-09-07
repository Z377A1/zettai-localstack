#!/bin/bash

set -e

# Ask for the bucket name if not provided as an environment variable
if [ -z "$BUCKET_NAME" ]; then
  read -p "Enter the S3 bucket name (default: localstack): " input
  BUCKET_NAME=${input:-localstack}
fi

# Define the bucket name
BUCKET_NAME="${BUCKET_NAME:-localstack}"

# Create the S3 bucket using AWS CLI with LocalStack endpoint
awslocal s3api create-bucket --bucket $BUCKET_NAME

# Apply bucket policy and CORS configuration
awslocal s3api put-bucket-policy --bucket $BUCKET_NAME --policy file://stacks/s3/bucket_policy.json
awslocal s3api get-bucket-policy --bucket $BUCKET_NAME
awslocal s3api put-bucket-cors --bucket $BUCKET_NAME --cors-configuration file://stacks/s3/cors_config.json
awslocal s3api get-bucket-cors --bucket $BUCKET_NAME

echo "S3 bucket '$BUCKET_NAME' created and configured successfully."
