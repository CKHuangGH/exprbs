#!/bin/bash
cluster=$1

apt-get update
sudo apt-get install vim -y
sudo apt-get install net-tools -y
sudo apt-get install python3-pip -y
sudo apt-get install jq -y
sudo apt install git -y
# pip3 install kubernetes
# pip3 install pandas==1.5.3
# pip3 install pint
# pip3 install prometheus_api_client
# pip3 install aiohttp


#curl -L https://raw.githubusercontent.com/open-cluster-management-io/clusteradm/main/install.sh | bash
# curl -s https://raw.githubusercontent.com/karmada-io/karmada/master/hack/install-cli.sh | sudo bash -s kubectl-karmada
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
curl -L -o vcluster "https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-linux-amd64" && sudo install -c -m 0755 vcluster /usr/local/bin && rm -f vcluster

wget https://github.com/kubernetes-sigs/kwok/releases/download/v0.3.0/kwok-linux-amd64
chmod +x kwok-linux-amd64
sudo mv kwok-linux-amd64 /usr/local/bin/kwok

wget https://github.com/kubernetes-sigs/kwok/releases/download/v0.3.0/kwokctl-linux-amd64
chmod +x kwokctl-linux-amd64
sudo mv kwokctl-linux-amd64 /usr/local/bin/kwokctl

#modify the address for kubeproxy
echo "copy metrics_server.yaml-----------------------"
mv /root/exprbs/kubernetes/metrics_server.yaml /root/
mv /root/exprbs/kubernetes/fakenode.yaml /root/


echo "Install Helm3-----------------------"
wget -c https://get.helm.sh/helm-v3.8.2-linux-amd64.tar.gz
tar xzvf helm-v3.8.2-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/
helm repo add stable https://charts.helm.sh/stable
helm repo add cilium https://helm.cilium.io/
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
echo "wait for 5 secs-------------------------"
sleep 5

echo "Install cilium-----------------------"
kubectl config use-context cluster$cluster
helm repo update
helm install cilium cilium/cilium --version 1.13.4 --wait --wait-for-jobs --namespace kube-system --set cluster.name=cluster$cluster --set cluster.id=$cluster


echo "Install Metrics server-----------------------"
kubectl --context=cluster$cluster create -f metrics_server.yaml
kubectl --context=cluster$cluster create -f fakenode.yaml
echo "-----------------------Member cluster$cluster is ready----------------------"