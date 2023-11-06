#!/bin/bash

# Set the etcd deployment YAML file path
etcd_deployment_yaml_file=/etc/kubernetes/manifests/etcd.yaml

# Add the `--quota-backend-bytes=8589934592` flag to the `etcd` container
sed -i '/etcd:/a\    - --quota-backend-bytes=8589934592' $etcd_deployment_yaml_file

# Print the updated etcd deployment YAML file
cat $etcd_deployment_yaml_file