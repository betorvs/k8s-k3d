ENV := $(PWD)/manifests/grafana-cloud/agent/.env

# Environment variables for project
include $(ENV)

# Export all variable to sub-make
export

# create cluster

create: 
	k3d registry create local0-registry --port 5050
	k3d cluster create local0 --port '8081:80@loadbalancer' --registry-use k3d-local0-registry:5050 --registry-config ./k3d-config/registries.yaml

delete: 
	k3d cluster delete local0
	k3d registry delete local0-registry


deploy-grafana-agent:
	cat manifests/grafana-cloud/agent/*yaml | envsubst | kubectl apply -f -

delete-grafana-agent:
	cat manifests/grafana-cloud/agent/*yaml | envsubst | kubectl delete -f -

status-grafana-agent:
	kubectl get deploy,svc,pods -n $(NAMESPACE)