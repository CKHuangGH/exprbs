#!/bin/bash

# Deploy Prometheus Federation on Cluster 0
kubectl config use-context cluster0
clusteradm clean --context cluster0