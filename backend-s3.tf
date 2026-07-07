terraform {
  backend "s3" {
    bucket = "state-tf-bucket-2026"
    key    = "statefile"
    region = "us-east-1"
  }
}

