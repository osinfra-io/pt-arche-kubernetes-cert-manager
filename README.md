# Kubernetes - cert-manager OpenTofu Module

[![OpenTofu Tests](https://img.shields.io/github/actions/workflow/status/osinfra-io/pt-arche-kubernetes-cert-manager/test.yml?style=for-the-badge&logo=opentofu&color=FEDA15&label=OpenTofu%20Tests)](https://github.com/osinfra-io/pt-arche-kubernetes-cert-manager/actions/workflows/test.yml) [![Dependabot](https://img.shields.io/github/actions/workflow/status/osinfra-io/pt-arche-kubernetes-cert-manager/dependabot.yml?style=for-the-badge&logo=github&color=2088FF&label=Dependabot)](https://github.com/osinfra-io/pt-arche-kubernetes-cert-manager/actions/workflows/dependabot.yml) [![Datadog Security Enabled](https://img.shields.io/badge/Datadog%20Security-Enabled-632CA6?style=for-the-badge&logo=datadog)](https://app.datadoghq.com/security/code-security/repositories?repository_id=pt-arche-kubernetes-cert-manager)

## Repository Description

Reusable OpenTofu child module for cert-manager on Google Kubernetes Engine (GKE).

## 🔩 Usage

### Module interfaces

| Source path | Purpose | Interface |
| --- | --- | --- |
| Repository root | Passes an externally generated shared root CA certificate and private key to regional consumers. | [`variables.tofu`](variables.tofu) · [`outputs.tofu`](outputs.tofu) |
| `//regional` | Deploys cert-manager and its CRDs through the official Helm chart. | [`regional/variables.tofu`](regional/variables.tofu) |
| `//regional/istio-csr` | Deploys cert-manager-istio-csr plus the Istio intermediate CA, issuers, and CA Secret. | [`regional/istio-csr/variables.tofu`](regional/istio-csr/variables.tofu) · [`regional/istio-csr/outputs.tofu`](regional/istio-csr/outputs.tofu) |

The root CA private key is a sensitive input/output and is copied into a Kubernetes Secret by `//regional/istio-csr`; restrict state, plan, and cluster-secret access accordingly. cert-manager defaults to one replica for each controller component. Istio CSR trusts `istio-system/ztunnel` for node-authenticated CSRs by default so ambient workloads can obtain identities; widening this list expands certificate-issuance authority. Helm workloads consume cluster resources, while certificate issuers may introduce separate provider or DNS costs.

> [!TIP]
> See [tests/fixtures](tests/fixtures) for example configurations.

### Istio ambient mesh (ztunnel) support

`regional/istio-csr` issues workload certificates for both sidecar and ambient Istio clients. Ambient mode's `ztunnel` runs once per node and requests certificates for multiple workload identities on that node, so it must be trusted to use Kubernetes node authentication for its CSRs. This is enabled by default via `trusted_node_service_accounts`, which grants the `istio-system/ztunnel` service account (matching the namespace and release name used in [pt-arche-kubernetes-istio](https://github.com/osinfra-io/pt-arche-kubernetes-istio)) node-authenticated CSR access.

Node authentication for CSRs requires `cert-manager-istio-csr` chart `v0.12.0` or later; this module already pins a newer version by default. Certificate issuance and rotation for ambient-only workloads should still be exercised against a live cluster as part of runtime validation — this can't be proven by this module's mocked tests alone.

## 🛠️ Tools

- [helm](https://github.com/helm/helm)
- [osinfra-pre-commit-hooks](https://github.com/osinfra-io/pt-techne-pre-commit-hooks)
- [pre-commit](https://github.com/pre-commit/pre-commit)

## 📋 Skills and Knowledge

- [cert-manager](https://cert-manager.io/docs)
  - [istio-csr](https://cert-manager.io/docs/usage/istio-csr/)
- [Istio ambient mesh](https://istio.io/latest/docs/ambient/)

## 🔍 Tests

Tests use [mocked providers](https://opentofu.org/docs/cli/commands/test/#the-mock_provider-blocks); no infrastructure or credentials are required.

```none
tofu init
```

```none
tofu test
```

## 📦 Release

To release a new version, simply push a new tag to the repository. The tag should be in the format `vX.Y.Z` where `X`, `Y`, and `Z` are integers.

```none
git tag vX.Y.Z
git push origin vX.Y.Z
```
