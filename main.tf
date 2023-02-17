provider "google" {
  credentials = file("iam-terraform-user.json")

  project = "menelas"
  region  = "europe-southwest1"
  zone    = "europe-southwest1-a"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "random_string" "auth_cloud_run_uuid" {
  length           = 16
}
