#!/bin/bash

# Deploy Prometheus Federation on Cluster 0

for i in $(cat node_list)
do
	ssh root@$i clusteradm unjoin --cluster-name cluster1
done

kubectl config use-context cluster1
kubectl delete ns open-cluster-management
kubectl delete ns open-cluster-management-agent
kubectl config use-context cluster0
clusteradm clean --context cluster0
kubectl delete ns cluster1












