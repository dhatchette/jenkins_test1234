provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  location      = var.region
  force_destroy = true

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365
    }
  }

  versioning {
    enabled = true
  }
}

variable "project_id" {
  description = "The ID of the project in which to create the bucket"
  type        = string
}

variable "region" {
  description = "The region in which to create the bucket"
  type        = string
  default     = "US"
}

variable "bucket_name" {
  description = "The name of the bucket to create"
  type        = string
}
