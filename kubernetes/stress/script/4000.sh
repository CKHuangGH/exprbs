#!/bin/bash

# 創建 Deployment 的範本 YAML
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

# 迴圈 200 次
for ((i=1; i<=200; i++)); do
    deployment_yaml="${deployment_template//INDEX/$i}"
    echo "$deployment_yaml" > nginx-deployment-$i.yaml
    
    # 使用 kubectl 創建 Deployment
    #kubectl apply -f nginx-deployment-$i.yaml
    clusteradm create work test$i -f nginx-deployment-$i.yaml --cluster cluster1
    rm -rf nginx-deployment-$i.yaml
done

echo $(date +'%s.%N') >> number.txt
echo "All deployments created." >> number.txt