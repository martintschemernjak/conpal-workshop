subscription_id     = "fa20c111-7584-474b-9419-b69723166ffd"
project_name        = "conpal-ws"
tenant_id           = "f70e8e1c-de5c-4b7b-a962-301a87f3f378"
stage_name          = "ws"
location            = "westeurope"
project_admin_email = "martin.tschemernjak@cloudflight.io"


# Database
postgresql_sku_name                      = "B_Standard_B1ms"
postgresql_storage_mb                    = 32768
postgresql_backup_retention_days         = 7
postgresql_public_network_access_enabled = true

# AKS
aks_agent_size = "Standard_D2s_v3"
aks_nodes      = 4
