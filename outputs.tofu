# Output Values
# https://opentofu.org/docs/language/values/outputs

output "tls_self_signed_cert_cert_manager_root_cert" {
  description = "The self-signed certificate for the cert-manager root certificate"
  value       = var.ca_cert_pem
}

output "tls_self_signed_cert_cert_manager_root_key" {
  description = "The private key for the cert-manager root certificate"
  sensitive   = true
  value       = var.ca_key_pem
}
