# Terraform Azure Resource Group Setup

This project demonstrates how to create an Azure Resource Group using Terraform and the AzureRM provider.

---

## 📦 Prerequisites

Make sure you have the following installed:

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

---

## 🔐 Step 1: Login to Azure

Open PowerShell and run:

```powershell
az login
```

Verify your account and subscription:

```powershell
az account show
```

or

```powershell
az account list --output table
```

---

## ⚠️ Step 2: Set Environment Variable (IMPORTANT)

Terraform **requires a subscription ID**.

Set it using:

```powershell
$env:ARM_SUBSCRIPTION_ID="your-subscription-id"
```

Example:

```powershell
$env:ARM_SUBSCRIPTION_ID="aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
```

✅ **Important:**

- Do **NOT** put `ARM_SUBSCRIPTION_ID` inside `main.tf`
- Terraform automatically reads it from the environment

---

## 🛠️ Step 3: Create `main.tf`

Create a file named `main.tf` and add:

```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "mtc-rg" {
  name     = "mtc-resources"
  location = "Canada Central"

  tags = {
    environment = "dev"
  }
}
```

---

## 🚀 Step 4: Initialize Terraform

```powershell
terraform init
```

---

## 📋 Step 5: Plan Deployment

```powershell
terraform plan
```

You should see:

```
Plan: 1 to add, 0 to change, 0 to destroy.
```

---

## ✅ Step 6: Apply Deployment

```powershell
terraform apply
```

Type:

```powershell
yes
```

---

## 🧹 (Optional) Destroy Resources

```powershell
terraform destroy
```

---

## 🧠 Key Takeaways

- Azure login (`az login`) is **not enough**
- Terraform needs a **subscription ID**
- Use environment variable:

```powershell
$env:ARM_SUBSCRIPTION_ID="your-id"
```

- Do **NOT** write this in `main.tf`:

```hcl
subscription_id = "ARM_SUBSCRIPTION_ID" ❌
```

---

## 📁 Project Structure

```
.
├── main.tf
└── README.md
```

---

## 🎯 Next Steps

- Add more Azure resources (Storage Account, VM, etc.)
- Learn about Terraform variables (`variables.tf`)
- Use `.tfvars` files for configuration
