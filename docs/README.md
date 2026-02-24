# Infrastructure Automation Workflows

This repository contains GitHub Actions workflows and CloudFormation templates for automated infrastructure provisioning and deprovisioning.

## Overview

- **Provisioning**: Automatically creates GitHub repositories and AWS infrastructure when Jira issues are approved
- **Deprovisioning**: Automatically cleans up resources when Jira issues are closed
- **Stack Management**: All AWS resources are managed as CloudFormation stacks

## Workflows

### Provision Infrastructure
- **File**: `.github/workflows/provision-infra.yaml`
- **Trigger**: Port automation when Jira issue status changes to "Open"
- **Creates**:
    - GitHub repository
    - CloudFormation stack
    - S3 bucket with versioning

### Deprovision Infrastructure
- **File**: `.github/workflows/deprovision-infra.yaml`
- **Trigger**: Port automation when Jira issue status changes to "Done" or "Closed"
- **Deletes**:
    - S3 bucket contents (all versions)
    - CloudFormation stack
    - GitHub repository (optional)

## CloudFormation Templates

### S3 Infrastructure
- **File**: `cloudformation/s3-infrastructure.yaml`
- **Resources**:
    - S3 bucket with versioning
    - Public access blocking
    - Lifecycle rules
    - Tagging for tracking

## Scripts

- `scripts/validate-stack.sh` - Validate CloudFormation templates
- `scripts/empty-s3-bucket.sh` - Empty S3 bucket before deletion
- `scripts/list-stacks.sh` - List all managed stacks

## Usage

See individual documentation files:
- [Provisioning Guide](PROVISIONING.md)
- [Deprovisioning Guide](DEPROVISIONING.md)
- [Troubleshooting](TROUBLESHOOTING.md)

## AWS Permissions

The workflows use AWS IAM role: `arn:aws:iam::158670531871:role/GitHubActionPort`

Required permissions:
- CloudFormation: Full access
- S3: Full access
- IAM: Passfor CloudFormation)

## Port Integration

These workflows are integrated with Port.io for:
- Automated triggering based on Jira issue status
- Workflow status reporting
- Run logs and history
