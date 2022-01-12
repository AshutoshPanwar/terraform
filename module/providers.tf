provider "azurerm" {
  # Configuration options
  features {}
}

provider "github" {
  # Configuration options
  token = var.GITHUB_TOKEN
  owner = "olivetech-io"
}