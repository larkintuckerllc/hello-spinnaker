terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 1.13.3"
    }
  }
  required_version = "~> 0.13.5"
}

provider "kubernetes" {
}

module "spinnaker" {
  source = "./modules/spinnaker"
}

