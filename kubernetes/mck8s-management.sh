#!/bin/bash 

# Deploy Prometheus Federation on Cluster 0
kubectl config use-context cluster0

export INSTALL_CLI_VERSION=1.5.0
curl -s https://raw.githubusercontent.com/karmada-io/karmada/master/hack/install-cli.sh | sudo bash -s kubectl-karmada

kubectl karmada init










# Install kubefedctl
# wget --tries=0 https://github.com/kubernetes-sigs/kubefed/releases/download/v0.9.2/kubefedctl-0.9.2-linux-amd64.tgz
# tar xzvf kubefedctl-0.9.2-linux-amd64.tgz
# mv kubefedctl /usr/local/bin/

# # Add helm chart

# kubectl config use-context cluster0
# helm repo add kubefed-charts https://raw.githubusercontent.com/kubernetes-sigs/kubefed/master/charts
# helm repo update

# # Deploy KubeFed
# helm --namespace kube-federation-system upgrade -i kubefed kubefed-charts/kubefed --version 0.9.2 --create-namespace

echo "------------------------Management node ok---------------------" 