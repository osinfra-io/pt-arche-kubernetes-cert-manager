# Input Variables
# https://opentofu.org/docs/language/values/variables

variable "cert_manager_istio_csr_version" {
  description = "The version to install for the Istio CSR, this is used for the chart as well as the image tag"
  type        = string
  default     = "0.15.1"
}

variable "chart_repository" {
  description = "The repository to pull the cert-manager Helm chart from"
  type        = string
  default     = "https://charts.jetstack.io"
}

variable "cluster_prefix" {
  description = "Prefix for your cluster name, region, and zone (if applicable) will be added to the end of the cluster name"
  type        = string
}

variable "resources_limits_cpu" {
  description = "The CPU limit for the Istio CSR container"
  type        = string
  default     = "50m"
}

variable "resources_limits_memory" {
  description = "The memory limit for the Istio CSR container"
  type        = string
  default     = "64Mi"
}

variable "resources_requests_cpu" {
  description = "The CPU request for the Istio CSR container"
  type        = string
  default     = "25m"
}

variable "resources_requests_memory" {
  description = "The memory request for the Istio CSR container"
  type        = string
  default     = "32Mi"
}

variable "tls_self_signed_cert_cert_manager_root_cert" {
  description = "The self-signed certificate for the cert-manager root certificate"
  type        = string
}

variable "tls_self_signed_cert_cert_manager_root_key" {
  description = "The private key for the cert-manager root certificate"
  type        = string
  sensitive   = true
}
