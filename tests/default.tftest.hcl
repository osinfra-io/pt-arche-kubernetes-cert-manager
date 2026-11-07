# Test
# https://opentofu.org/docs/cli/commands/test

# Mock Providers
# https://opentofu.org/docs/cli/commands/test/#the-mock_provider-blocks

mock_provider "google" {}
mock_provider "helm" {}
mock_provider "kubernetes" {}
mock_provider "terraform" {}

run "default" {
  command = apply

  module {
    source = "./tests/fixtures/default"
  }
}

run "default_regional" {
  command = apply

  module {
    source = "./tests/fixtures/default/regional"
  }
}

run "default_regional_istio_csr" {
  command = apply

  module {
    source = "./tests/fixtures/default/regional/istio-csr"
  }

  assert {
    condition     = output.trusted_node_service_accounts == "istio-system/ztunnel"
    error_message = "The istio-csr Helm release must trust the ztunnel node identity for ambient mesh certificate issuance"
  }
}

run "istio_csr_unified_tags" {
  command = plan

  module {
    source = "./regional/istio-csr"
  }

  override_module {
    target = module.core_helpers
    outputs = {
      env         = "prod"
      environment = "production"
      region      = "us-east1"
      zone        = "b"
    }
  }

  variables {
    cluster_prefix                              = "mock-cluster"
    tls_self_signed_cert_cert_manager_root_cert = "mock-cert"
    tls_self_signed_cert_cert_manager_root_key  = "mock-key"
  }

  assert {
    condition = yamldecode(helm_release.cert_manager_istio_csr.values[0]).podLabels == {
      "tags.datadoghq.com/env"     = "production"
      "tags.datadoghq.com/service" = "cert-manager-istio-csr"
      "tags.datadoghq.com/version" = var.cert_manager_istio_csr_version
    }
    error_message = "istio-csr must render all unified service tags together with its existing service identity."
  }
}
