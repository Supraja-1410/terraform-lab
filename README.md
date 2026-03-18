# Day 7 – Advanced Bonus Challenge (Dynamic Infrastructure using Terraform)

## 📌 Objective

To dynamically create multiple Docker containers using Terraform variables, loops, and modules instead of manually defining each resource.

---

## 🧠 Concept

In this assignment, we used Terraform's **for_each** feature along with a **list of objects variable** to automatically create multiple containers based on input configuration.

This demonstrates how infrastructure can scale dynamically without modifying core Terraform code.

---

## ⚙️ Implementation Details

### 1. Variable Definition

We defined a variable `container_config` as a list of objects:

```hcl
container_config = [
  {
    name = "web1"
    port = 8081
  },
  {
    name = "web2"
    port = 8082
  },
  {
    name = "web3"
    port = 8083
  }
]
```

---

### 2. Dynamic Resource Creation

Used `for_each` to create containers dynamically:

```hcl
for_each = {
  for container in var.container_config :
  container.name => container
}
```

---

### 3. Container Configuration

Each container:

* Uses **nginx image**
* Has a **unique name**
* Runs on a **specified port**

---

### 4. Output Variable

Terraform outputs all container URLs:

```hcl
output "container_urls" {
  value = [
    for c in var.container_config :
    "http://localhost:${c.port}"
  ]
}
```

---

## 🚀 How to Run

```bash
terraform init
terraform apply
```

---

## 🌐 Output

After deployment:

* http://localhost:8081
* http://localhost:8082
* http://localhost:8083

---

## 🔥 Key Feature

👉 To add a new container, just update `terraform.tfvars`:

```hcl
{
  name = "web4"
  port = 8084
}
```

Then run:

```bash
terraform apply
```

✅ New container is created automatically
❌ No changes required in Terraform code

---

## 🎯 Terraform Concepts Used

* Variables (list of objects)
* for_each
* Modules
* Outputs
* Dynamic Infrastructure

---

## ✅ Result

Successfully implemented dynamic infrastructure where containers are created, updated, or destroyed automatically based on input configuration.

---

## 📷 Output Screenshot

(Add screenshot of `docker ps` and `terraform output` here)

---

## 🏁 Conclusion

This assignment demonstrates how Terraform enables scalable and maintainable infrastructure by separating configuration logic from input data.
