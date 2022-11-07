module "clf-azure-setup-deploy" {
  source = "git::git@git.internal.cloudflight.io:cloudflight/libs/cloudflight-terraform.git//modules/clf-azure-setup-deploy"

  subscription_id                = "15c6e514-0cbc-4c6d-b386-8a3e01037a06"
  project_name                   = "sample-project"
  admins                         = {
    "Max Muster" = {
      object_id = "88888888-4444-4444-4444-121212121212"
    }
  }
  service_principle_display_name = "p-1111-sample-project"
}