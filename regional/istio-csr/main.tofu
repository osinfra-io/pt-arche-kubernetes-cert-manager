# Helm Release
# https://search.opentofu.org/provider/hashicorp/helm/latest/docs/resources/release

resource "helm_release" "cert_manager_istio_csr" {
  chart      = "cert-manager-istio-csr"
  name       = "cert-manager-istio-csr"
  namespace  = "cert-manager"
  repository = var.chart_repository

  set = local.helm_values

  values = [
    file("${path.module}/helm/cert-manager-istio-csr.yml")
  ]

  version = var.cert_manager_istio_csr_version
}

# Kubernetes Manifest Resource
# https://search.opentofu.org/provider/hashicorp/kubernetes/latest/docs/resources/manifest

resource "kubernetes_manifest" "istio_ca_certificate" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "Certificate"

    metadata = {
      name      = "istio-ca"
      namespace = "istio-system"
    }

    spec = {
      commonName = "istio-intermediate-ca.osinfra.io"
      duration   = "720h"
      isCA       = true

      issuerRef = {
        name  = kubernetes_manifest.istio_intermediate_ca_issuer.manifest.metadata.name
        kind  = "Issuer"
        group = "cert-manager.io"
      }

      privateKey = {
        algorithm = "ECDSA"
        size      = 256
      }

      secretName = "istio-ca"

      subject = {
        organizations = ["Open Source Infrastructure (as Code) Istio Intermediate CA"]
      }
    }
  }
}

resource "kubernetes_manifest" "istio_ca_issuer" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "Issuer"

    metadata = {
      name      = "istio-ca"
      namespace = "istio-system"
    }

    spec = {
      ca = {
        secretName = "istio-ca"
      }
    }
  }
}

# Kubernetes Secret Resource
# https://search.opentofu.org/provider/hashicorp/kubernetes/latest/docs/resources/secret_v1

resource "kubernetes_secret_v1" "istio_cert_manager_ca" {
  metadata {
    name      = "cert-manager-ca"
    namespace = "istio-system"
  }

  data = {
    "tls.crt" = var.tls_self_signed_cert_cert_manager_root_cert
    "tls.key" = var.tls_self_signed_cert_cert_manager_root_key
  }
}

resource "kubernetes_manifest" "istio_intermediate_ca_issuer" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "Issuer"

    metadata = {
      name      = "istio-intermediate-ca"
      namespace = "istio-system"
    }

    spec = {
      ca = {
        secretName = kubernetes_secret_v1.istio_cert_manager_ca.metadata[0].name
      }
    }
  }
}

