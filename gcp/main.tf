terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.45.0"
    }
  }
  required_version = "~> 0.13.5"
}

provider "google" {
  project = var.project
}

module "halyard" {
  source = "./modules/halyard"
  zone   = var.zones[0] 
}

