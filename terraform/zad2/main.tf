terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.24.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_tag" "nginx_latest" {
  source_image  = docker_image.nginx.latest
  target_image  = "nginx:new-tag"  # Nowa etykietka
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8080
  }
}

output "address" {
  value = "http://localhost:${docker_container.nginx.ports[0].external}"
}