terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "cv_image" {
  name = "najaheya/cv-one-page1:latest"
}

resource "docker_container" "cv_container" {
  name  = "moncv"
  image = docker_image.cv_image.image_id
  ports {
    internal = 80
    external = 8585
  }
}
