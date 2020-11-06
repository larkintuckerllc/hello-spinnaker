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

module "cluster" {
  source = "./modules/cluster"
  region = var.region
  zones  = var.zones
}
 
