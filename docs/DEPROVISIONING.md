
---

### **13. `docs/DEPROVISIONING.md`**

```markdown
# Deprovisioning Guide

## Automatic Deprovisioning

Infrastructure is automatically deprovisioned when a Jira issue status changes to "Done" or "Closed".

## What Gets Deleted

1. **S3 Bucket**
   - All objects deleted
   - All versions deleted
   - All delete markers removed
   - Bucket deleted

2. **CloudFormation Stack**
   - Stack deleted
   - All resources removed

3. **GitHub Repository** (optional)
   - Repository deleted if `delete_repo=true`

## Manual Deprovisioning

To manually trigger deprovisioning:

1. Go to GitHub Actions in the workflows repository
2. Select "Deprovision Infrastructure" workflow
3. Click "Run workflow"
4. Fill in parameters:
   - repo_name
   - environment
   - jira_issue_key
   - delete_repo (true/false)

## Safety Checks

The workflow includes safety checks:
- Verifies stack exists before deletion
- Empties S3 bucket completely (including versions)
- Waits for stack deletion to complete
- Reports any errors to Port

## Verification

After deprovisioning, verify:

```bash
# Check stack is deleted
aws cloudformation describe-stacks \
  --stack-name <repo-name>-dev-stack \
  --region us-east-2
# Should return: Stack does not exist

# Check bucket is deleted
aws s3 ls s3://<repo-name>-dev
# Should return: Bucket does not exist

# Check repository is deleted
gh repo view capocean/<repo-name>
# Should return: Repository not found
