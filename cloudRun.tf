resource "google_cloud_run_service" "cloudRunAuth" {
  name     = "menelas-auth"
  location = "europe-southwest1"

  metadata {
    annotations = {
      #    This sets the service to only allow all traffic
      "run.googleapis.com/ingress" = "all"
    }
  }

  template {
    spec {
      containers {
        image = "europe-southwest1-docker.pkg.dev/menelas/menelas-img-registry/menelas-auth"
        env {
          name = "MONGODB"
          value = var.auth_mongolink
        }
        env {
          name = "JSON_PASS"
          value = var.auth_jsonpass
        }
        env {
          name = "MONGO_ROOT_USER"
          value = var.auth_mongo_user
        }
        env {
          name = "MONGO_ROOT_PASSWORD"
          value = var.auth_mongo_pass
        }
        ports {
          container_port = 8090
        }
      }
    }

    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale"      = "2"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  autogenerate_revision_name = true
}

resource "google_cloud_run_service" "cloudRunApi" {
  name     = "menelas-api"
  location = "europe-southwest1"

  metadata {
    annotations = {
      #    This sets the service to only allow all traffic
      "run.googleapis.com/ingress" = "all"
    }
  }

  template {
    spec {
      containers {
        image = "europe-southwest1-docker.pkg.dev/menelas/menelas-img-registry/menelas-api"
        env {
          name = "HOST"
          value = var.api_db_host
        }
        env {
          name = "USER"
          value = var.api_db_user
        }
        env {
          name = "PASSWORD"
          value = var.api_db_pass
        }
        env {
          name = "DATABASE"
          value = "menelas"
        }
        ports {
          container_port = 8393
        }
      }

      timeout_seconds = 500
    }

    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale"      = "2"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  autogenerate_revision_name = true
}


resource "google_cloud_run_service" "phpMyAdmin" {
  name     = "php-my-admin"
  location = "europe-southwest1"

  metadata {
    annotations = {
      "run.googleapis.com/ingress" = "all"
    }
  }

  template {
    spec {
      containers {
        image = "phpmyadmin/phpmyadmin"
        env {
          name = "PMA_HOST"
          value = var.api_db_host
        }
        env {
          name = "PMA_PORT"
          value = 3306
        }
        ports {
          container_port = 80
        }
      }

      timeout_seconds = 500
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  autogenerate_revision_name = true
}

