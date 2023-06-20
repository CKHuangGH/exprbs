#!/bin/bash

# Deploy Prometheus Federation on Cluster 0
kubectl config use-context cluster0

kubectl karmada init

read -p "please enter the last cluster number in .kube: " number

cp /etc/karmada/karmada-apiserver.config /root/.kube


for i in `seq 0 $number`
do
    sed -i 's/kubernetes-admin/k8s-admin-cluster'$i'/g' ~/.kube/cluster$i
    sed -i 's/name: kubernetes/name: cluster'$i'/g' ~/.kube/cluster$i
    sed -i 's/cluster: kubernetes/cluster: cluster'$i'/g' ~/.kube/cluster$i
done

for i in `seq 0 $number`
do
    string=$string"/root/.kube/cluster$i:"
done

string=$string"/root/.kube/karmada-apiserver.config"
string=$string | sed "s/.$//g"

KUBECONFIG=$string kubectl config view --flatten > ~/.kube/config

for i in `seq 0 $number`
do
    kubectl config rename-context k8s-admin-cluster$i@kubernetes cluster$i
done

kubectl config rename-context karmada-apiserver kpi

#rm -rf /usr/local/bin/kubectl-karmada