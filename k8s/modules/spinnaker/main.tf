resource "kubernetes_namespace" "this" {
  metadata {
    name = "spinnaker"
  }
}

resource "kubernetes_service_account" "this" {
  metadata {
    name      = "spinnaker-service-account"
    namespace = kubernetes_namespace.this.metadata[0].name
  }
}

resource "kubernetes_cluster_role_binding" "this" {
  metadata {
    name = "spinnaker-admin"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.this.metadata[0].name
    namespace = kubernetes_namespace.this.metadata[0].name
  }
}

