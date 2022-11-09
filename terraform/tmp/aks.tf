module "clf-azure-aks" {
  source = "./modules/clf-azure-aks"

  project_name            = var.project_name
  resource_group          = module.clf-azure-platform.resource_group
  key_vault               = module.clf-azure-platform.key_vault
  log_analytics_workspace = module.clf-azure-platform.log_analytics_workspace
  container_registry      = module.clf-azure-platform.container_registry
  subnet                  = module.clf-azure-platform.subnet_aks
  application_insights    = module.clf-azure-platform.application_insights
  action_group            = module.clf-azure-platform.monitor_action_group
  vm_size                 = var.aks_agent_size

  search_queries_image_names   = ["exampleImageName"]
  monitoring_availability_urls = { "appName" = "https://appName.cloudflight.io" }

  node_count = var.aks_nodes
}
