resource "google_service_account" "airflow-bucket-prod-sa" {
  account_id = "airflow-bucket-prod-accessor"
}

resource "google_service_account" "airflow-bucket-stage-sa" {
  account_id = "airflow-bucket-stage-accessor"
}

resource "google_storage_bucket_iam_member" "airflow-bucket-stage-access" {
  bucket = google_storage_bucket.stage-artifact-bucket.name
  role = "roles/storage.objectAdmin"
  member     = "serviceAccount:${google_service_account.airflow-bucket-stage-sa.email}"
}

resource "google_storage_bucket_iam_member" "airflow-bucket-prod-read-access" {
  bucket = google_storage_bucket.prod-artifact-bucket.name
  role = "roles/storage.objectViewer"
  member     = "serviceAccount:${google_service_account.airflow-bucket-stage-sa.email}"
}

resource "google_storage_bucket_iam_member" "airflow-bucket-prod-access" {
  bucket = google_storage_bucket.prod-artifact-bucket.name
  role = "roles/storage.objectAdmin"
  member     = "serviceAccount:${google_service_account.airflow-bucket-prod-sa.email}"
}

