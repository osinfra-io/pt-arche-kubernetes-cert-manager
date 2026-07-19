# Input Variables
# https://opentofu.org/docs/language/values/variables

variable "cainjector_replicas" {
  description = "The number of replicas to run for the cainjector"
  type        = number
  default     = 1
}

variable "cainjector_resources_limits_cpu" {
  description = "The CPU limit for the cainjector resources"
  type        = string
  default     = "20m"
}

variable "cainjector_resources_limits_memory" {
  description = "The memory limit for the cainjector resources"
  type        = string
  default     = "64Mi"
}

variable "cainjector_resources_requests_cpu" {
  description = "The CPU request for the cainjector resources"
  type        = string
  default     = "10m"
}

variable "cainjector_resources_requests_memory" {
  description = "The memory request for the cainjector resources"
  type        = string
  default     = "32Mi"
}

variable "cert_manager_version" {
  description = "The version to install, this is used for the chart as well as the image tag"
  type        = string
  default     = "1.21.0"
}

variable "chart_repository" {
  description = "The repository to pull the cert-manager Helm chart from"
  type        = string
  default     = "https://charts.jetstack.io"
}

variable "replicas" {
  description = "The number of replicas to run"
  type        = number
  default     = 1
}

variable "resources_limits_cpu" {
  description = "The CPU limit for the resources"
  type        = string
  default     = "20m"
}

variable "resources_limits_memory" {
  description = "The memory limit for the resources"
  type        = string
  default     = "64Mi"
}

variable "resources_requests_cpu" {
  description = "The CPU request for the resources"
  type        = string
  default     = "10m"
}

variable "resources_requests_memory" {
  description = "The memory request for the resources"
  type        = string
  default     = "32Mi"
}

variable "startupapicheck_resources_limits_cpu" {
  description = "The CPU limit for the startupapicheck resources"
  type        = string
  default     = "20m"
}

variable "startupapicheck_resources_limits_memory" {
  description = "The memory limit for the startupapicheck resources"
  type        = string
  default     = "64Mi"
}

variable "startupapicheck_resources_requests_cpu" {
  description = "The CPU request for the startupapicheck resources"
  type        = string
  default     = "10m"
}

variable "startupapicheck_resources_requests_memory" {
  description = "The memory request for the startupapicheck resources"
  type        = string
  default     = "32Mi"
}

variable "webhook_replicas" {
  description = "The number of replicas to run for the webhook"
  type        = number
  default     = 1
}

variable "webhook_resources_limits_cpu" {
  description = "The CPU limit for the webhook resources"
  type        = string
  default     = "20m"
}

variable "webhook_resources_limits_memory" {
  description = "The memory limit for the webhook resources"
  type        = string
  default     = "64Mi"
}

variable "webhook_resources_requests_cpu" {
  description = "The CPU request for the webhook resources"
  type        = string
  default     = "10m"
}

variable "webhook_resources_requests_memory" {
  description = "The memory request for the webhook resources"
  type        = string
  default     = "32Mi"
}
