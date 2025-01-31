#!/bin/bash

# Deploy Prometheus Federation on Cluster 0
kubectl config use-context cluster0

kubectl karmada init > temp.sh
grep "clusteradm join" temp.sh > run.sh

for i in $(cat node_list)
do
    ssh root@$i kubectl taint nodes --all node-role.kubernetes.io/control-plane:NoSchedule-
done
sleep 10
./auto.sh

#clusteradm init --wait --context cluster1 &
# clusteradm init --wait --context cluster2 &