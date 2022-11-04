module "clf-azure-postgresql" {
  source = "./modules/clf-azure-postgresql"

  resource_group       = module.clf-azure-platform.resource_group
  project_name         = var.project_name
  key_vault            = module.clf-azure-platform.key_vault
  monitor_action_group = module.clf-azure-platform.monitor_action_group
  subnet               = module.clf-azure-platform.subnet_postgres

  server_sku            = var.postgresql_sku_name
  storage_mb            = var.postgresql_storage_mb
  backup_retention_days = var.postgresql_backup_retention_days

  public_network_access_enabled = var.postgresql_public_network_access_enabled

  databases = {
    "keycloak" = {}
  }

  firewall_rules = {
    aks = {
      start_ip_address = module.clf-azure-aks.outbound_ip.ip_address
      end_ip_address   = module.clf-azure-aks.outbound_ip.ip_address
    }
    cloudflight_1 = {
      start_ip_address = "185.225.96.3"
      end_ip_address   = "185.225.96.3"
    }
    cloudflight_2 = {
      start_ip_address = "185.225.96.4"
      end_ip_address   = "185.225.96.4"
    }
    cloudflight_3 = {
      start_ip_address = "185.225.96.6"
      end_ip_address   = "185.225.96.6"
    }
    cloudflight_4 = {
      start_ip_address = "185.225.96.35"
      end_ip_address   = "185.225.96.35"
    }
    cloudflight_5 = {
      start_ip_address = "185.225.96.36"
      end_ip_address   = "185.225.96.36"
    }
    cloudflight_6 = {
      start_ip_address = "185.225.96.38"
      end_ip_address   = "185.225.96.38"
    }
    cloudflight_7 = {
      start_ip_address = "185.225.98.7"
      end_ip_address   = "185.225.98.7"
    }
    cloudflight_8 = {
      start_ip_address = "185.225.96.195"
      end_ip_address   = "185.225.96.195"
    }
    cloudflight_9 = {
      start_ip_address = "185.225.96.196"
      end_ip_address   = "185.225.96.196"
    }
    cloudflight_10 = {
      start_ip_address = "5.2.197.133"
      end_ip_address   = "5.2.197.133"
    }
    cloudflight_11 = {
      start_ip_address = "217.110.241.10"
      end_ip_address   = "217.110.241.10"
    }
    cloudflight_12 = {
      start_ip_address = "185.89.162.202"
      end_ip_address   = "185.89.162.202"
    }
    cloudflight_13 = {
      start_ip_address = "82.218.187.242"
      end_ip_address   = "82.218.187.242"
    }
    cloudflight_14 = {
      start_ip_address = "185.225.97.90"
      end_ip_address   = "185.225.97.90"
    }
    cloudflight_15 = {
      start_ip_address = "185.225.97.92"
      end_ip_address   = "185.225.97.92"
    }
    cloudflight_16 = {
      start_ip_address = "185.225.97.96"
      end_ip_address   = "185.225.97.96"
    }
    cloudflight_17 = {
      start_ip_address = "194.112.157.109"
      end_ip_address   = "194.112.157.109"
    }
    conpal_1 = {
      start_ip_address = "5.10.165.186"
      end_ip_address   = "5.10.165.186"
    }
    conpal_2 = {
      start_ip_address = "5.10.165.187"
      end_ip_address   = "5.10.165.187"
    }
    conpal_3 = {
      start_ip_address = "5.10.165.188"
      end_ip_address   = "5.10.165.188"
    }
    conpal_4 = {
      start_ip_address = "5.10.165.189"
      end_ip_address   = "5.10.165.189"
    }
    conpal_5 = {
      start_ip_address = "5.10.165.190"
      end_ip_address   = "5.10.165.190"
    }
    conpal_6 = {
      start_ip_address = "185.194.65.206"
      end_ip_address   = "185.194.65.206"
    }
    conpal_7 = {
      start_ip_address = "83.164.155.114"
      end_ip_address   = "83.164.155.114"
    }
  }

  private_endpoints = {
    endpoint_1 = {
      virtual_network = module.clf-azure-platform.virtual_network
      subnet          = module.clf-azure-platform.subnet_postgres
    }
  }
}

