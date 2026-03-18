# Day 1 – Introduction to Terraform & Local File Creation

## 📌 Objective

To understand the basics of Terraform and create a simple resource using the **local provider**.

---

## 🧠 Concept

Terraform is an Infrastructure as Code (IaC) tool that allows us to define and manage resources using configuration files.

In this assignment, we created a **local file** using Terraform to understand:

* Providers
* Resources
* Variables
* Outputs

---

## ⚙️ Implementation Details

### 1. Provider Configuration

We used the **local provider**:

```hcl id="a1b2c3"
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

We created a file using `local_file` resource:

```hcl id="d4e5f6"
resource "local_file" "hello" {
  filename = "hello.txt"
  content  = var.message
}
```

---

### 3. Variables

Defined a variable for file content:

```hcl id="g7h8i9"
variable "message" {
  description = "Content to write into the file"
  type        = string
}
```

---

### 4. Output

Displayed the file name:

```hcl id="j1k2l3"
output "file_name" {
  value = local_file.hello.filename
}
```

---

## 🚀 How to Run

```bash id="m4n5o6"
terraform init
terraform plan
terraform apply
```

---

## 📄 Result

* A file named **hello.txt** is created
* The file contains the message provided as input

---

## 🎯 Terraform Concepts Used

* Provider (local)
* Resource (local_file)
* Variables
* Output values

---

## 📷 Output Screenshot

(Add screenshot of generated `hello.txt` and terminal output)

---

## 🏁 Conclusion

This assignment helped in understanding the basic structure of Terraform configuration and how to create and manage simple resources locally.
