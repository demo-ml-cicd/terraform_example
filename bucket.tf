resource "google_storage_bucket" "stage-artifact-bucket" {
  default_event_based_hold = "false"
  force_destroy            = "false"

  location                    = var.region
  name                        = "${var.name}-stage-bucket"
  project                     = var.project
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"

  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type = "Delete"
    }
  }
}

resource "google_storage_bucket" "prod-artifact-bucket" {
  default_event_based_hold = "false"
  force_destroy            = "false"

  location                    = var.region
  name                        = "${var.name}-prod-bucket"
  project                     = var.project
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"

}