#!/bin/bash

set -e

if [ -z "$1" ]; then
  echo "Usage: ./empty-s3-bucket.sh <bucket-name>"
  exit 1
fi

BUCKET_NAME=$1

echo "Emptying S3 bucket: $BUCKET_NAME"

aws s3 rm "s3://$BUCKET_NAME" --recursive

echo "Deleting all object versions..."
aws s3api list-object-versions \
  --bucket "$BUCKET_NAME" \
  --query 'Versions[].{Key:Key,VersionId:VersionId}' \
  --output json | \
jq -r '.[] | "--key \(.Key) --version-id \(.VersionId)"' | \
xargs -I {} aws s3api delete-object --bucket "$BUCKET_NAME" {}

echo "Deleting all delete markers..."
aws s3api list-object-versions \
  --bucket "$BUCKET_NAME" \
  --query 'DeleteMarkers[].{Key:Key,VersionId:VersionId}' \
  --output json | \
jq -r '.[] | "--key \(.Key) --version-id \(.VersionId)"' | \
xargs -I {} aws s3api delete-object --bucket "$BUCKET_NAME" {}

echo "Bucket emptied successfully"