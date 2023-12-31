terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.72.0"
    }
  }
}

provider "google" {
  user_project_override = true
  billing_project       = "<PROJECT_ID>"
}

module "cloud-policies" {
  source  = "artefactory/cloud-policies/google"
  version = "~> 0"

  parent_id            = "folders/<FOLDER_ID>" # Folder where the pre-defined policies will be applied
  admin_project_id     = "<PROJECT_ID>"        # Project within the folder that will be used for admin activities
  allowed_customer_ids = ["<CUSTOMER_ID>"]     # Your Google Workspace or Client Identity customer ID
  allowed_domains      = ["<DOMAIN>"]          # Your Google Workspace or domain you use for Cloud Identity
}
