module "clf-azure-platform" {
  source = "git::git@git.internal.cloudflight.io:cloudflight/libs/cloudflight-terraform.git//modules/clf-azure-platform"

  subscription_id     = var.subscription_id
  project_name        = var.project_name
  project_admin_email = var.project_admin_email
}
