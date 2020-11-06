resource "google_service_account" "this" {
  account_id   = "spinnaker-service-account"
  display_name = "Spinnaker Service Account"
}

resource "google_project_iam_binding" "this" {
  role = "roles/storage.admin"
  members = [
    "serviceAccount:${google_service_account.this.email}"
  ]
}

