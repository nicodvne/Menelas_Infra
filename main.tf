provider "google" {
  credentials = file("iam-terraform-user.json")

  project = "menelas"
  region  = "europe-southwest1"
  zone    = "europe-southwest1-a"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
