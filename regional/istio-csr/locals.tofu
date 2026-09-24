# Local Values
# https://opentofu.org/docs/language/values/locals

locals {
  cluster_id = module.core_helpers.zone != null ? "${var.cluster_prefix}-${module.core_helpers.region}-${module.core_helpers.zone}-${module.core_helpers.env}" : "${var.cluster_prefix}-${module.core_helpers.region}-${module.core_helpers.env}"

  helm_values = {
    app = {
      server = {
        caTrustedNodeAccounts = join(",", var.trusted_node_service_accounts)
        clusterID             = local.cluster_id
      }
    }

    podLabels = {
      "tags.datadoghq.com/env"     = module.core_helpers.environment
      "tags.datadoghq.com/version" = var.cert_manager_istio_csr_version
    }

    resources = {
      limits = {
        cpu    = var.resources_limits_cpu
        memory = var.resources_limits_memory
      }

      requests = {
        cpu    = var.resources_requests_cpu
        memory = var.resources_requests_memory
      }
    }
  }
}
