variable "container_config" {
  description = "List of container configs"
  type = list(object({
    name = string
    port = number
  }))
}
