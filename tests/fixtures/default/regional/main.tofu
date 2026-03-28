# Required Providers
# https://opentofu.org/docs/language/providers/requirements

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    helm = {
      source = "hashicorp/helm"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

# Kubernetes Cert Manager
# https://github.com/osinfra-io/pt-arche-kubernetes-cert-manager

module "test" {
  source = "../../../../regional"

  artifact_registry = "mock-docker.pkg.dev/mock-project/mock-virtual"
}
