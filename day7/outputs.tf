output "container_urls" {
  value = [
    for container in var.container_config :
    "http://localhost:${container.port}"
  ]
}
