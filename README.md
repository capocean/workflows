# Infrastructure Automation Workflows

Automated infrastructure provisioning and deprovisioning workflows integrated with Port.io and Jira.

## Quick Start

1. **Automatic Provisioning**: Change Jira issue status to "Open"
2. **Automatic Deprovisioning**: Change Jira issue status to "Done" or "Closed"

## Documentation

- [Full Documentation](docs/README.md)
- [Provisioning Guide](docs/PROVISIONING.md)
- [Deprovisioning Guide](docs/DEPROVISIONING.md)
- [Troubleshooting](docs/TROUBLESHOOTING.md)

## Repository Structure


## Current Features

- ✅ Automated GitHub repository creation
- ✅ CloudFormation-based infrastructure management
- ✅ S3 bucket provisioning with versioning
- ✅ Automatic cleanup on Jira issue closure
- ✅ Port.io integration for tracking

## Future Enhancements

- 🔜 EC2 instance provisioning
- 🔜 EKS cluster provisioning
- 🔜 Multi-environment support
- 🔜 Cost tracking and reporting

## AWS Resources

- **Region**: us-east-2
- **IAM Role**: GitHubActionPort
- **Stack Naming**: `<repo-name>-<environment>-stack`

## Port Integration

- **Organization**: capocean
- **Automations**:
    - Create Repo Upon Jira Approval
    - Deprovision Repo on Jira Close

## Support

For issues or questions:
1. Check [Troubleshooting Guide](docs/TROUBLESHOOTING.md)
2. Review GitHub Actions logs
3. Contact DevOps team

