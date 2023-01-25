resource "google_artifact_registry_repository" "menelas-registry" {
  location      = "europe-southwest1"
  repository_id = "menelas-img-registry"
  description   = "Menelas images registry"
  format        = "DOCKER"
}