# Kubernetes Cert Manager
# https://github.com/osinfra-io/pt-arche-kubernetes-cert-manager

module "test" {
  source = "../../../"

  ca_cert_pem = "mock-cert"
  ca_key_pem  = "mock-key"
}
