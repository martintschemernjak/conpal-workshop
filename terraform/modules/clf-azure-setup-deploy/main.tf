data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "main" {
  name     = "rg-${var.project_name}-${var.location}-deploy"
  location = var.location
}

resource "azurerm_key_vault" "main" {
  name                        = "kv-${var.project_name}-deploy"
  location                    = var.location
  resource_group_name         = azurerm_resource_group.main.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  enable_rbac_authorization   = true

  sku_name = "standard"
}

resource "azurerm_role_assignment" "deploy_key_vault_admin" {
  for_each = var.admins

  scope                = azurerm_resource_group.main.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = each.value.object_id
}

data "azuread_application" "main" {
  display_name = var.service_principle_display_name
}

resource "azurerm_key_vault_certificate" "main" {
  name         = "deploy-cert"
  key_vault_id = azurerm_key_vault.main.id

  certificate_policy {
    issuer_parameters {
      name = "Self"
    }

    key_properties {
      exportable = true
      key_size   = 2048
      key_type   = "RSA"
      reuse_key  = true
    }

    lifetime_action {
      action {
        action_type = "AutoRenew"
      }

      trigger {
        days_before_expiry = 30
      }
    }

    secret_properties {
      content_type = "application/x-pkcs12"
    }

    x509_certificate_properties {
      extended_key_usage = ["1.3.6.1.5.5.7.3.2"]

      key_usage = [
        "dataEncipherment",
        "digitalSignature",
        "keyCertSign",
        "keyEncipherment",
      ]

      subject            = "CN=${var.service_principle_display_name}"
      validity_in_months = 24
    }
  }
}

resource "azuread_application_certificate" "main" {
  application_object_id = data.azuread_application.main.id
  type                 = "AsymmetricX509Cert"
  encoding              = "hex"
  value                 = azurerm_key_vault_certificate.main.certificate_data
  end_date              = azurerm_key_vault_certificate.main.certificate_attribute[0].expires
  start_date            = azurerm_key_vault_certificate.main.certificate_attribute[0].not_before
}

data "azurerm_subscription" "main" {
  subscription_id = var.subscription_id
}

data "azuread_service_principal" "main" {
  display_name = var.service_principle_display_name
}

resource "azurerm_role_assignment" "main" {
  scope              = data.azurerm_subscription.main.id
  role_definition_name = "Contributor"
  principal_id       = data.azuread_service_principal.main.id
}

resource "azurerm_role_assignment" "vault" {
  scope                = data.azurerm_subscription.main.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azuread_service_principal.main.id
}

data "azurerm_key_vault_certificate_data" "main" {
  name         = azurerm_key_vault_certificate.main.name
  key_vault_id = azurerm_key_vault.main.id
}

resource "local_sensitive_file" "cert_pem" {
    content  = "${data.azurerm_key_vault_certificate_data.main.pem}\n${data.azurerm_key_vault_certificate_data.main.key}"
    filename = "${path.cwd}/${var.project_name}-azurerm.pem"
}

resource "local_sensitive_file" "cert_pem_b64" {
    content  = base64encode("${data.azurerm_key_vault_certificate_data.main.pem}\n${data.azurerm_key_vault_certificate_data.main.key}")
    filename = "${path.cwd}/${var.project_name}-azurerm.pem.b64"
}

data "azurerm_key_vault_secret" "cert" {
  name         = azurerm_key_vault_certificate.main.name
  key_vault_id = azurerm_key_vault.main.id
}

resource "local_sensitive_file" "cert_pfx" {
    content_base64  =  data.azurerm_key_vault_secret.cert.value
    filename = "${path.cwd}/${var.project_name}-azurerm.pfx"
}

resource "local_sensitive_file" "cert_pfx_b64" {
    content  =  data.azurerm_key_vault_secret.cert.value
    filename = "${path.cwd}/${var.project_name}-azurerm.pfx.b64"
}
