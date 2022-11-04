# Cloudflight Platform for Azure

![](https://img.shields.io/badge/maturity-incubating-yellow)

This module creates:

- Monthly budget alert if the actual budget reaches 50% of the defined amount
- Monthly budget alert if the forecasted budget exceeds 100% of the defined amount
- Log Analytics
- Azure Insights
- Alerting: E-Mail and App push notifications in case a web test fails
- Key Vault
- Container registry
- Virtual network, including a transfer subnet to hold (optional) private endpoints for specific resources like app services, database,
    redis

Names of all created resources are prefixed with the project name.

See inputs and outputs section on what needs to be defined, what is optional and
what you can expect as an output.

### Open Issues

- [ ] Automatic tagging

<!-- DO NOT REMOVE THESE COMMENTS -->
<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
