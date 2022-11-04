# PostgreSQL Database for Azure

![](https://img.shields.io/badge/maturity-sandbox-red)

This module creates:

- PostgreSQL server and database
- Random admin username & password in the provided key vault
- Health alert
- Optionally a private endpoint including dns zone & virtual network link

Names of all created resources are prefixed with the project name.

See inputs and outputs section on what needs to be defined, what is optional and what you can expect as an output.

### Required Roles

- Key Vault Administrator

<!-- DO NOT REMOVE THESE COMMENTS -->
<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
