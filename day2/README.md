# Day 2 – Using Variables in Terraform

## 📌 Objective

To understand how to use **variables in Terraform** to make configurations reusable and dynamic.

---

## 🧠 Concept

In Day 1, values were hardcoded.
In this assignment, we improved flexibility by introducing **input variables**.

This allows users to provide values at runtime instead of modifying the code.

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

Created a file using dynamic values:

```hcl
resource "local_file" "file" {
  filename = var.filename
  content  = var.message
}
```

---

### 3. Variable Definitions

Defined variables for file name and content:

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

### 4. Variable Values

Values can be provided in multiple ways:

#### Option 1: Using terraform.tfvars

```hcl
filename = "output.txt"
message  = "Hello from Terraform Day 2"
```

#### Option 2: During execution

```bash
terraform apply
```

Then enter values when prompted.

---

## 🚀 How to Run

```bash
terraform init
terraform plan
terraform apply
```

---

## 📄 Result

* A file is created with the name provided by the user
* The file contains the message provided as input

---

## 🎯 Terraform Concepts Used

* Input Variables
* Variable Types
* Dynamic Resource Configuration
* Provider (local)

---

## 🔥 Key Improvement Over Day 1

| Day 1            | Day 2                          |
| ---------------- | ------------------------------ |
| Hardcoded values | Dynamic values using variables |
| Less flexible    | Reusable configur              |

---

## 🏁 Conclusion

This assignment demonstrates how Terraform configurations can be made flexible and reusable using variables, which is essential for real-world infrastructure management.
