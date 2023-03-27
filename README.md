# kubernetes k3d config files repository

[k3d](https://k3d.io/)

## Create local0 cluster

```bash
k3d registry create local0-registry --port 5050
k3d cluster create local0 --port '8081:80@loadbalancer' --registry-use k3d-local0-registry:5050 --registry-config ./k3d-config/registries.yaml
```

## Use Grafana Cloud for observability

Create an free account in [Grafana Cloud](https://grafana.com/auth/sign-in).

Install [grafana agent](./manifests/grafana-cloud/agent/README.md).