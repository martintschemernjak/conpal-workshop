module "clf-azure-platform" {
  source = "./modules/clf-azure-platform"

  subscription_id                     = "/subscriptions/${var.subscription_id}"
  project_name                        = var.project_name
  project_admin_email                 = var.project_admin_email
  stage_name                          = var.stage_name
  resource_group_name                 = "rg-lancrypt-${var.stage_name}-${var.location}-001"
  subnet_address_prefixes             = ["192.168.0.0/19"]
  subnet_address_prefixes_postgressql = ["192.168.32.0/24"]
  tf_service_principal_ids = [
    "4345f3eb-2f35-41ec-8c03-d27a90545bb3",
    "3f57d932-5a1e-457d-9c0a-d8ba419b40db",
    "1639d4dd-feaa-456c-b418-d50439fd5717",
    "d6934920-4485-42d6-82e5-8f1b90358ae3",
    "3d87a595-fc9c-4d43-9557-b92b0c07a8ad",
    "68b4072b-ecc7-4bce-87c8-7114d1e55f7f",
    "2cf6e20e-caa6-4337-9698-6d29f2961d06",
    "0abff554-4726-4533-ba60-d697f3b2333e",
    "dfb78b23-b136-4588-b7f5-f48ce4a12221",
    "48a37c41-33cd-4a54-a659-e1bbe821f7c1",
    "bc759c2d-61a8-4da6-a8e0-524b232a6080",
    "87e066ce-421e-4542-9bd5-74b2ec2ccdbf",
    "ff07c8cd-a271-4f6b-b963-5e8d8246f16a",
    "2d78c88a-c5b8-4ea7-9b2b-ef3327034bed",
    "dc3fbfe7-9a11-4038-826f-9d445cef073e",
    "076bafec-4fbd-40f0-a35f-9848551e537a",
    "27c02e45-881a-4499-9df0-f4687912d311",
    "ad6e4a33-8133-44ff-808c-43d602034936",
    "45a2390d-e5c1-4ec5-a9b3-3cdcd2b77f4d",
    "6e23c17f-20d3-4dd2-bc2b-dd55708c9318",
    "56c7dd6c-7ba4-485c-abe4-bffe817e878f",
    "75bde26f-96fd-4129-93c1-575ab80ad304",
    "fd0f7fec-8b19-46a9-8a47-29c8b01fcbb7"
  ]
}
