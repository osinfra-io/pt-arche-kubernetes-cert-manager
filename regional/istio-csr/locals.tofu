# Local Values
# https://opentofu.org/docs/language/values/locals

locals {
  cluster_id = module.core_helpers.zone != null ? "${var.cluster_prefix}-${module.core_helpers.region}-${module.core_helpers.zone}-${module.core_helpers.env}" : "${var.cluster_prefix}-${module.core_helpers.region}-${module.core_helpers.env}"

  helm_values = [
    for k, v in local.helm_values_map : {
      name  = k
      value = v
    }
  ]

  helm_values_map = {
    "app.server.clusterID"                     = local.cluster_id
    "podLabels.tags\\.datadoghq\\.com/env"     = module.core_helpers.environment
    "podLabels.tags\\.datadoghq\\.com/version" = var.cert_manager_istio_csr_version
    "resources.limits.cpu"                     = var.resources_limits_cpu
    "resources.limits.memory"                  = var.resources_limits_memory
    "resources.requests.cpu"                   = var.resources_requests_cpu
    "resources.requests.memory"                = var.resources_requests_memory
  }

}
