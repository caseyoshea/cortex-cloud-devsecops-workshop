provider "google" {
  project = "qwiklabs-gcp-02-a51b4a1ed010"
  region  = "us-central1"
}

resource "google_storage_bucket" "example" {
  name          = "mongo-${random_id.rand_suffix.hex}"
  location      = "us-central1"
  force_destroy = true

  uniform_bucket_level_access = false
  public_access_prevention = "enforced"
}

resource "random_id" "rand_suffix" {
  byte_length = 4
}

output "bucket_name" {
  value = google_storage_bucket.example.name
}
