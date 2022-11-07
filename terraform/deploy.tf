module "clf-azure-setup-deploy" {
  source = "./modules/clf-azure-setup-deploy"

  subscription_id                = var.subscription_id
  project_name                   = var.project_name
  location                       = var.location
  admins                         = {
    "Martin Tschemernjak" = {
      object_id = "4345f3eb-2f35-41ec-8c03-d27a90545bb3"
    }
  }
  service_principle_display_name = "sp-deploy-${var.project_name}-001"
}