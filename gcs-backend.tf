terraform {
  backend "gcs" {
    bucket = "gcp-terraform-backend-2026"
    prefix = "three-tier-dev"
  }
}