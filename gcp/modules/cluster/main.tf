resource "google_container_cluster" "this" {
  initial_node_count       = 1
  location                 = var.region
  name                     = "my-cluster"
  node_locations           = var.zones
  remove_default_node_pool = true
}

resource "google_container_node_pool" "this" {
  cluster    = google_container_cluster.this.name
  location   = var.region
  name       = "my-node-pool"
  node_count = 1
}

