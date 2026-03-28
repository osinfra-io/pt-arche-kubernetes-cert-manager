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
  source = "../../../../../regional/istio-csr"

  artifact_registry                           = "mock-docker.pkg.dev/mock-project/mock-virtual"
  cluster_prefix                              = "mock-cluster"
  tls_self_signed_cert_cert_manager_root_cert = "mock-cert"
  tls_self_signed_cert_cert_manager_root_key  = "mock-key"
}
