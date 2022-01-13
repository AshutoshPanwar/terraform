provider "azurerm" {
  # Configuration options
  features {}
}

provider "github" {
  # Configuration options
  token = var.GITHUB_TOKEN
  owner = "olivetech-io"
}

resource "random_string" "myrandom" {
  length = 3
  upper = false 
  special = false
  number = false   
}