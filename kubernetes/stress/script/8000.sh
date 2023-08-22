
# 迴圈 500 次
for ((i=1; i<=8000; i++)); do
    deployment_yaml=$(cat <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-$i
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
    clusteradm create work test$i -f - <<< "$deployment_yaml" --cluster cluster1
	
done
echo "All deployments created." >> number.txt
echo $(date +'%s.%N') >> number.txt