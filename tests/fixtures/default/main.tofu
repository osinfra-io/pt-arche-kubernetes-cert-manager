# Required Providers
# https://opentofu.org/docs/language/providers/requirements

terraform {
  required_providers {
    tls = {
      source = "hashicorp/tls"
    }
  }
}

# Kubernetes Cert Manager
# https://github.com/osinfra-io/pt-arche-kubernetes-cert-manager

module "test" {
  source = "../../../"
}
