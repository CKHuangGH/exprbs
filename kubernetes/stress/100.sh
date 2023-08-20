#!/bin/bash


deployment_template=$(cat << EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: fake-pod-INDEX
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      app: fake-pod
  template:
    metadata:
      labels:
        app: fake-pod
    spec:
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: type
                operator: In
                values:
                - kwok
      # A taints was added to an automatically created Node.
      # You can remove taints of Node or add this tolerations.
      tolerations:
      - key: "kwok.x-k8s.io/node"
        operator: "Exists"
        effect: "NoSchedule"
      containers:
      - name: fake-container
        image: fake-image
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