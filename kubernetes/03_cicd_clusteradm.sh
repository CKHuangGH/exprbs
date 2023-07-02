#!/bin/bash

# Deploy Prometheus Federation on Cluster 0
kubectl config use-context cluster0
for i in `seq 0 1`
do
    kubectl config use-context cluster$i
	helm repo update
	helm install cilium cilium/cilium --version 1.13.4 --wait --wait-for-jobs --namespace kube-system --set cluster.name=cluster$i --set cluster.id=$i
done