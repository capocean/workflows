
---

### **14. `docs/TROUBLESHOOTING.md`**

```markdown
# Troubleshooting Guide

## Common Issues

### Provisioning Failures

#### Exists
**Error**: `Stack already exists`

**Solution**:
```bash
# Delete existing stack first
aws cloudformation delete-stack \
  --stack-name <repo-name>-dev-stack \
  --region us-east-2
