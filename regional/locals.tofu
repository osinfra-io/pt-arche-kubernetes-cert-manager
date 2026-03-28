# Local Values
# https://opentofu.org/docs/language/values/locals

locals {
  helm_values = [
    for k, v in local.helm_values_map : {
      name  = k
      value = v
    }
  ]

  helm_values_map = {
    "cainjector.podLabels.tags\\.datadoghq\\.com/service"      = "cert-manager-cainjector"
    "cainjector.resources.limits.cpu"                          = var.cainjector_resources_limits_cpu
    "cainjector.resources.limits.memory"                       = var.cainjector_resources_limits_memory
    "cainjector.resources.requests.cpu"                        = var.cainjector_resources_requests_cpu
    "cainjector.resources.requests.memory"                     = var.cainjector_resources_requests_memory
    "cainjector.replicaCount"                                  = var.cainjector_replicas
    "global.commonLabels.tags\\.datadoghq\\.com/env"           = module.core_helpers.environment
    "global.commonLabels.tags\\.datadoghq\\.com/version"       = var.cert_manager_version
    "podLabels.tags\\.datadoghq\\.com/service"                 = "cert-manager"
    "resources.limits.cpu"                                     = var.resources_limits_cpu
    "resources.limits.memory"                                  = var.resources_limits_memory
    "resources.requests.cpu"                                   = var.resources_requests_cpu
    "resources.requests.memory"                                = var.resources_requests_memory
    "replicaCount"                                             = var.replicas
    "startupapicheck.podLabels.tags\\.datadoghq\\.com/service" = "cert-manager-startupapicheck"
    "startupapicheck.resources.limits.cpu"                     = var.startupapicheck_resources_limits_cpu
    "startupapicheck.resources.limits.memory"                  = var.startupapicheck_resources_limits_memory
    "startupapicheck.resources.requests.cpu"                   = var.startupapicheck_resources_requests_cpu
    "startupapicheck.resources.requests.memory"                = var.startupapicheck_resources_requests_memory
    "webhook.podLabels.tags\\.datadoghq\\.com/service"         = "cert-manager-webhook"
    "webhook.resources.limits.cpu"                             = var.webhook_resources_limits_cpu
    "webhook.resources.limits.memory"                          = var.webhook_resources_limits_memory
    "webhook.resources.requests.cpu"                           = var.webhook_resources_requests_cpu
    "webhook.resources.requests.memory"                        = var.webhook_resources_requests_memory
    "webhook.replicaCount"                                     = var.webhook_replicas
  }

}
