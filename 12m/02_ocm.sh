#!/bin/bash

# Deploy Prometheus Federation on Cluster 0
kubectl config use-context cluster0

clusteradm init --wait --context cluster0 > temp.sh
grep "clusteradm join" temp.sh > run.sh
./auto.sh 

sleep 300
cluster=1
for i in $(cat node_list)
do
    clusteradm accept --clusters "cluster${cluster}"
done

#clusteradm init --wait --context cluster1 &
# clusteradm init --wait --context cluster2 &