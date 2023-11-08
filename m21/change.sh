#!/bin/bash

# Set the etcd deployment YAML file path
etcd_deployment_yaml_file=/etc/kubernetes/manifests/etcd.yaml
api_deployment_yaml_file=/etc/kubernetes/manifests/kube-apiserver.yaml
# Add the `--quota-backend-bytes=8589934592` flag to the `etcd` container
sed -i '/snapshot-count=10000/a\    - --quota-backend-bytes=8589934592' $etcd_deployment_yaml_file
sed -i '/snapshot-count=10000/a\    - --auto-compaction-mode=revision' $etcd_deployment_yaml_file
sed -i '/snapshot-count=10000/a\    - --auto-compaction-retention=1000' $etcd_deployment_yaml_file

sed -i '/secure-port=6443/a\    - --max-requests-inflight=2000' $api_deployment_yaml_file
sed -i '/secure-port=6443/a\    - --max-mutating-requests-inflight=1000' $api_deployment_yaml_file

# Print the updated etcd deployment YAML file
cat $etcd_deployment_yaml_file
cat $api_deployment_yaml_file