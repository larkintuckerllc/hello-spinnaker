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

module "cluster" {
  source = "./modules/cluster"
  master_version = var.master_version
  node_version   = var.node_version
  region         = var.region
  zones          = var.zones
}

module "halyard" {
  source = "./modules/halyard"
  zone   = var.zones[0] 
}

