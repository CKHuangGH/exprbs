#!/bin/bash
cluster=$1

#modify the address for kubeproxy
echo "copy metrics_server.yaml-----------------------"
mv /root/exprbs/0-kubefed/metrics_server.yaml /root/

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
helm install cilium cilium/cilium --version 1.11.4 --wait --wait-for-jobs --namespace kube-system --set cluster.name=cluster$cluster --set cluster.id=$cluster


echo "Install Metrics server-----------------------"
kubectl --context=cluster$cluster create -f metrics_server.yaml

echo "-----------------------Member cluster$cluster is ready----------------------"