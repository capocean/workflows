# Provisioning Guide

## Automatic Provisioning

Infrastructure is automatically provisioned when a Jira issue status changes from "Waiting for approval" to "Open".

## What Gets Created

1. **GitHub Repository**
    - Organization: capocean
    - Name: Derived from Jira issue title (lowercase, hyphens)
    - Visibility: Public
    - Auto-initialized with README

2. **CloudFormation Stack**
    - Name: `<repo-name>-<environment>-stack`
    - Region: us-east-2
    - Tags: JiraIssue, ManagedBy, Environment, Repository

3. **S3 Bucket**
    - Name: `<repo-name>-<environment>`
    - Versioning: Enabled
    - Public Access: Blocked
    - Lifecycle: Delete old versions after 90 days

## Manual Provisioning

To manually trigger provisioning:

1. Go to GitHub Actions in the workflows repository
2. Select "Provision Infrastructure" workflow
3. Click "Run workflow"
4. Fill in parameters:
    - repo_name
    - repo_description
    - jira_issue_key
    - environment (dev/staging/prod)

## Verification

After provisioning, verify:

```bash
# Check CloudFormation stack
aws cloudformation describe-stacks \
  --stack-name <repo-name>-dev-stack \
  --region us-east-2

# Check S3 bucket
aws s3 ls s3://<repo-name>-dev

# Check GitHub repository
gh repo view capocean/<repo-name>
