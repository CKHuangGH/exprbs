#!/bin/bash

# Deploy Prometheus Federation on Cluster 0
kubectl config use-context cluster0

clusteradm init --wait --context cluster0
clusteradm init --wait --context cluster1
clusteradm init --wait --context cluster2