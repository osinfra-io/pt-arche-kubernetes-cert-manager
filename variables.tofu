# Input Variables
# https://opentofu.org/docs/language/values/variables

variable "ca_cert_pem" {
  description = "The PEM-encoded certificate for the cert-manager root CA, shared across all clusters so Istio mTLS trusts a single root"
  type        = string
}

variable "ca_key_pem" {
  description = "The PEM-encoded private key for the cert-manager root CA"
  sensitive   = true
  type        = string
}
