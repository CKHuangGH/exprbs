
# 迴圈 500 次
for ((i=1; i<=1000; i++)); do
    deployment_yaml=$(cat <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-$i
  namespace: default
spec:
  replicas: 10
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
          image: docker.io/library/nginx:latest
          imagePullPolicy: Never
EOF
)
    kubectl --kubeconfig=kubeconfig.yaml apply -f - <<< "$deployment_yaml"
	
done