variable "GITHUB_TOKEN" {
  type        = string
  description = "Please enter your GitHub-PAT"
}

variable "Repo-name" {
  type        = string
  description = "Enter the name of New github repo"
  default     = "new-repo"
}

variable "org-prefix" {
  type        = string
  description = "Organization name"
  default     = "olivetech"
}

variable "rg-name" {
  type        = string
  description = "Resource group name"
  default     = "myrg"
}

variable "locations" {
  type        = map(string)
  description = "azure datacenter locations"
  default = {
    "USA" = "centralus"
    "IND" = "centralindia"
    "CND" = "canadacentral"
    "AST" = "australiacentral"
    "KRC" = "koreacentral"
  }
}