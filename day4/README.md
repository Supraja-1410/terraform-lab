# Day 4 – Terraform Modules and Docker Containers

## 📌 Objective

To learn how to use **Terraform modules** to create reusable infrastructure components and deploy multiple **Docker containers** dynamically.

---

## 🧠 Concept

Modules allow you to **encapsulate Terraform resources** and reuse them multiple times.
In this assignment, we:

* Created a module for an **nginx container**
* Used the module multiple times to deploy several containers
* Leveraged variables for flexibility

---

## ⚙️ Implementation Details

### 1. Module Structure

```
terraform-lab/day4/
├── main.tf
├── variables.tf
├── outputs.tf
└── modules/
    └── nginx/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

The module `nginx` contains:

```hcl
resource "docker_container" "nginx" {
  image = var.image
  name  = var.name
  ports {
    internal = 80
    external = var.port
  }
}
```

Variables for the module:

```hcl
variable "name" { type = string }
variable "image" { type = string }
variable "port" { type = number }
```

---

### 2. Root Configuration

Called the module multiple times:

```hcl
module "nginx1" {
  source = "./modules/nginx"
  name   = "nginx1"
  image  = "nginx:latest"
  port   = 8080
}

module "nginx2" {
  source = "./modules/nginx"
  name   = "nginx2"
  image  = "nginx:latest"
  port   = 8081
}
```

---

### 3. Running Terraform

```bash
terraform init
terraform apply
```

After execution, the containers are created:

```
docker ps
CONTAINER ID   IMAGE          PORTS
...            nginx:latest   0.0.0.0:8080->80/tcp
...            nginx:latest   0.0.0.0:8081->80/tcp
```

---

## 🎯 Terraform Concepts Used

* Modules
* Variables
* Docker Provider
* Reusable resource definitions
* Outputs (optional)

---

## 🔥 Key Learning

* **Modules** simplify managing repetitive infrastructure.
* Changes in the module automatically apply to all instances.
* Modular Terraform code is easier to read, maintain, and scale.

---

## 🏁 Conclusion

This assignment shows the power of Terraform modules and provider integration (Docker).
Modules allow creating consistent, reusable infrastructure for multiple containers with minimal code duplication.
