module "clf-azure-aks" {
  source = "git::git@git.internal.cloudflight.io:cloudflight/libs/cloudflight-terraform.git//modules/clf-azure-aks"

  project_name            = var.project_name
  resource_group          = module.clf-platform.resource_group
  key_vault               = module.clf-platform.key_vault
  log_analytics_workspace = module.clf-platform.log_analytics_workspace
  container_registry      = module.clf-platform.container_registry
  subnet                  = module.clf-platform.subnet
  application_insights    = module.clf-platform.application_insights
  action_group            = module.clf-platform.monitor_action_group

  search_queries_image_names   = ["exampleImageName"]
  monitoring_availability_urls = { "appName" = "https://appName.cloudflight.io" }
}
