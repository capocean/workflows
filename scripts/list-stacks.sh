#!/bin/bash

set -e

echo "Listing all CloudFormation stacks managed by Port..."

aws cloudformation list-stacks \
  --stack-status-filter \
    CREATE_COMPLETE \
    UPDATE_COMPLETE \
    UPDATE_ROLLBACK_COMPLETE \
  --region us-east-2 \
  --query 'StackSummaries[?contains(StackName, `-stack`)].{Name:StackName,Status:StackStatus,Created:CreationTime}' \
  --output table

echo ""
echo "To view details of a specific stack:"
echo "  aws cloudformation describe-stacks --stack-name <stack-name> --region us-east-2"