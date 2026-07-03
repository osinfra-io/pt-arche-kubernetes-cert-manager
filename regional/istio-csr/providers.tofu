terraform {
  required_providers {

    # Helm Provider
    # https://search.opentofu.org/provider/hashicorp/helm/latest/docs

    helm = {
      source = "hashicorp/helm"
    }

    # Kubernetes Provider
    # https://search.opentofu.org/provider/hashicorp/kubernetes/latest/docs

    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}
