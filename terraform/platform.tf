module "clf-azure-platform" {
  source = "./modules/clf-azure-platform"

  subscription_id                       = "/subscriptions/${var.subscription_id}"
  project_name                          = var.project_name
  project_admin_email                   = var.project_admin_email
  stage_name                            = var.stage_name
  resource_group_name                   = "rg-lancrypt-${var.stage_name}-${var.location}-001"
  subnet_address_prefixes               = ["192.168.0.0/19"]
  subnet_address_prefixes_postgressql   = ["192.168.32.0/24"]
}