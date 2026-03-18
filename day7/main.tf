terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

module "nginx" {
  for_each = {
    for container in var.container_config :
    container.name => container
  }

  source = "./modules/nginx"

  name  = each.value.name
  port  = each.value.port
  image = docker_image.nginx.image_id
}
