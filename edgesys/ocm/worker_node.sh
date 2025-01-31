#!/bin/bash
cluster=$1

apt-get update
sudo apt-get install vim -y
sudo apt-get install net-tools -y
sudo apt-get install python3-pip -y
sudo apt-get install jq -y
sudo apt install git -y
sudo apt install ntpdate -y
sudo service ntp stop
sudo ntpdate ntp.midway.ovh
sudo service ntp start
# pip3 install kubernetes
# pip3 install pandas==1.5.3
# pip3 install pint
# pip3 install prometheus_api_client
# pip3 install aiohttp

sudo rm -rf /usr/bin/kubectl

sudo curl -LO https://dl.k8s.io/release/v1.32.1/bin/linux/amd64/kubectl

sudo install -o root -g root -m 0755 kubectl /usr/bin/kubectl


#curl -L https://raw.githubusercontent.com/open-cluster-management-io/clusteradm/main/install.sh | bash
# curl -s https://raw.githubusercontent.com/karmada-io/karmada/master/hack/install-cli.sh | sudo bash -s kubectl-karmada
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
#curl -L -o vcluster "https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-linux-amd64" && sudo install -c -m 0755 vcluster /usr/local/bin && rm -f vcluster

#modify the address for kubeproxy
echo "copy metrics_server.yaml-----------------------"
mv /root/exprbs/edgesys/ocm/metrics_server.yaml /root/
cp /root/exprbs/edgesys/ocm/node_list /root/

echo "Install Helm3-----------------------"
wget -c https://get.helm.sh/helm-v3.8.2-linux-amd64.tar.gz
tar xzvf helm-v3.8.2-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/
helm repo add stable https://charts.helm.sh/stable
helm repo add cilium https://helm.cilium.io/
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
echo "wait for 5 secs-------------------------"
sleep 30

echo "Install cilium-----------------------"
kubectl config use-context cluster$cluster
helm repo update
helm install cilium cilium/cilium --version 1.13.4 --wait --wait-for-jobs --namespace kube-system --set operator.replicas=1

sleep 30

echo "Install Metrics server-----------------------"
kubectl --context=cluster$cluster create -f metrics_server.yaml

echo "-----------------------Member cluster$cluster is ready----------------------"