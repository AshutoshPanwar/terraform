resource "github_repository" "olivetech_repo" {
  name       = var.Repo-name
  visibility = "private"
}

output "clone-url" {
  value = resource.github_repository.olivetech_repo.git_clone_url
}