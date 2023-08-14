#!/bin/bash


deployment_template=$(cat << EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-INDEX
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx
EOF
)

for ((i=1; i<=100; i++)); do
    deployment_yaml="${deployment_template//INDEX/$i}"
    echo "$deployment_yaml" > nginx-deployment-$i.yaml
    
    clusteradm create work test$i -f nginx-deployment-$i.yaml --cluster cluster1
    rm -rf nginx-deployment-$i.yaml
done
echo $(date +'%s.%N') >> number.txt
echo "All deployments created." >> number.txt