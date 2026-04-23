# Terraform Azure Resource Group Setup

This project demonstrates how to create an Azure Resource Group using Terraform and the AzureRM provider.

---

## Prerequisites

Make sure you have the following installed:

- Terraform
- Azure CLI

---

## Step 1: Login to Azure

Open PowerShell and run:

```powershell
az login
```

Verify your account and subscription:

```powershell
az account show
```

---

## Step 2: Set Environment Variable

Terraform requires a subscription ID.

Set it using:

```powershell
$env:ARM_SUBSCRIPTION_ID="your-subscription-id"
```

---

## Step 3: Create `variables.tf`

Create a file named `variables.tf` and add:

```hcl
variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "mtc-resources"
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "Canada Central"
}

variable "environment" {
  description = "Environment tag (e.g., dev, prod)"
  type        = string
  default     = "dev"
}
```

---

## Step 4: Create `main.tf`

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
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = var.environment
  }
}
```

---

## Step 5: Initialize Terraform

```powershell
terraform init
```

---

## Step 6: Plan Deployment

```powershell
terraform plan
```

You should see:

```
Plan: 1 to add, 0 to change, 0 to destroy.
```

---

## Step 7: Apply Deployment

```powershell
terraform apply
```

Type:

```powershell
yes
```

---

## Step 8: Destroy Resources (Optional)

```powershell
terraform destroy
```

---

## Project Structure

```
.
├── main.tf
├── variables.tf
├── README.md
└── .gitignore
```
