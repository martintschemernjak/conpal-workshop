## Create deployment setup for terraform

Given a subscription, a service-principle and a list of users this module creates

- Resource group for the deployment resources
- Key Vault
- Certificate for Service Principle authentication
- Role Assignments for the given Service Principle and Users
- Local Certificate Files ready to be used in our Pipeline

Names of created resource group (RG) is prefixed with the project name.
Also the created RG is not meant to be used for any other use-cases. 
To add your project resources, use RG created by the setup-module!

#### Why?

In most cases we use Service-Principles to connect our deployment Pipeline to Azure. This is achieved by using a Azure AD Application (= Service Principle) in combination with Certificate Authentication. Issuing and configuring this authentication is cumbersome and errorprone. Using this module in combination with the clf-azure-setup-terraform module enables easy project initialization on azure.

### HowTo

- Get your subscription and service-principle
- Authenticate yourself using `az login`
- Follow the initial steps listed in the clf-azure-setup-terraform module's README
- Add this module to the main.tf (see example)
- Save the generated certificate-files as pipeline secrets
- continue with the follow-up steps in the clf-azure-setup-terraform module's README

!!! info

    Please note that this module adds sensitive files (certificate + key) to your working directory. 
    This makes it easy to use them (e.g. as pipeline-secrets), but also poses a security risk.
    Please be careful handeling this module. Add `*.pem` and `*.pfx` to `.gitignore` and delete
    the files after you used them. Also keep in mind that the state-file contains highly sensitive
    data (login credentials, certificates, keys, etc.) as well; Please keep it safe or delete it after the setup is finished!

<!-- DO NOT REMOVE THESE COMMENTS -->
<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
