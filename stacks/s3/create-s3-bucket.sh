#!/bin/bash

set -e

BUCKET_NAME="localstack"

awslocal s3api create-bucket --bucket $BUCKET_NAME
awslocal s3api put-bucket-policy --bucket $BUCKET_NAME --policy file://stacks/s3/bucket_policy.json

# awslocal s3 sync ./stacks/s3/data s3://$BUCKET_NAME
