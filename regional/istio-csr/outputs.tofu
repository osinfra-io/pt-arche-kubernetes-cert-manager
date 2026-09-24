# Output Values
# https://opentofu.org/docs/language/values/outputs

output "trusted_node_service_accounts" {
  description = "The rendered comma-separated list of service accounts trusted for node-authenticated CSRs (e.g. Istio ambient's ztunnel)"
  value       = local.helm_values.app.server.caTrustedNodeAccounts
}
