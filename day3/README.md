# Day 3 – Terraform Outputs

## 📌 Objective

To understand how to use **output variables in Terraform** to display useful information after resource creation.

---

## 🧠 Concept

In this assignment, we learned how Terraform can **return values after execution** using outputs.

Outputs are useful for:

* Debugging
* Displaying results
* Passing values between modules

---

## ⚙️ Implementation Details

### 1. Provider Configuration

We used the **local provider**:

```hcl
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "local" {}
```

---

### 2. Resource Definition

Created a file:

```hcl
resource "local_file" "file" {
  filename = var.filename
  content  = var.message
}
```

---

### 3. Variables

```hcl
variable "filename" {
  description = "Name of the file"
  type        = string
}

variable "message" {
  description = "Content of the file"
  type        = string
}
```

---

### 4. Output Definition

Displayed values after execution:

```hcl
output "file_name" {
  value = local_file.file.filename
}

output "file_content" {
  value = local_file.file.content
}
```

---

## 🚀 How to Run

```bash
terraform init
terraform apply
```

---

## 📄 Result

After running Terraform, outputs are displayed:

* File name
* File content

Example:

```
file_name = "output.txt"
file_content = "Hello from Terraform"
```

---

## 🎯 Terraform Concepts Used

* Outputs
* Resource attributes
* Variables
* Provider (local)

---

## 🔥 Key Learning

👉 Terraform not only creates resources but also **returns useful data** after execution.

This is very important in real-world projects where outputs are passed between modules 

---

## 🏁 Conclusion

This assignment demonstrates how Terraform outputs help in retrieving and displaying important information, making infrastructure more transparent and easier to manage.
