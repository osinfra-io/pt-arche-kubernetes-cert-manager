# Helm Release
# https://search.opentofu.org/provider/hashicorp/helm/latest/docs/resources/release

resource "helm_release" "cert_manager" {
  chart      = "cert-manager"
  name       = "cert-manager"
  namespace  = "cert-manager"
  repository = var.chart_repository

  set = local.helm_values

  values = [
    file("${path.module}/helm/cert-manager.yml")
  ]

  version = var.cert_manager_version
}
