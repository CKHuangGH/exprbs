#!/bin/bash

# Deploy Prometheus Federation on Cluster 0
kubectl config use-context cluster0

kubectl karmada init

read -p "please enter the last cluster number in .kube: " number

cp /etc/karmada/karmada-apiserver.config /root/.kube


for i in `seq 0 $number`
do
    string=$string"/root/.kube/cluster$i:"
done

string=$string"/root/.kube/karmada-apiserver.config"
string=$string | sed "s/.$//g"

KUBECONFIG=$string kubectl config view --flatten > ~/.kube/config