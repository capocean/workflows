#!/bin/bash

set -e

echo "Validating CloudFormation templates..."

for template in cloudformation/*.yaml; do
  if [ -f "$template" ]; then
    echo "Validating: $template"
    aws cloudformation validate-template \
      --template-body file://$template \
      --region us-east-2 > /dev/null
    echo "  Valid"
  fi
done

echo "All templates are valid"