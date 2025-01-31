#!/bin/bash

# Deploy Prometheus Federation on Cluster 0
kubectl config use-context cluster0

kubectl karmada init

REGISTER_CMD=$(kubectl karmada token create --print-register-command --kubeconfig=/etc/karmada/karmada-apiserver.config)


cluster=1
for i in $(cat node_list)
do
    eval "$REGISTER_CMD --kubeconfig=$HOME/.kube/cluster$cluster"
    cluster=$((cluster+1))
done


for i in $(cat node_list)
do
    ssh root@$i kubectl taint nodes --all node-role.kubernetes.io/control-plane:NoSchedule-
done