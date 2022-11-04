module "clf-azure-postgresql" {
  source = "git::git@git.internal.cloudflight.io:cloudflight/libs/cloudflight-terraform.git//modules/clf-azure-postgresql"

  resource_group       = module.clf-platform.resource_group
  project_name         = var.project_name
  key_vault            = module.clf-platform.key_vault
  monitor_action_group = module.clf-platform.monitor_action_group

  databases = {
    "sampledb" = {}
  }

  private_endpoints = {
    endpoint_1 = {
      virtual_network = module.clf-platform.virtual_network
      subnet          = module.clf-platform.subnet
    }
  }
}
