number=$1
# 迴圈 500 次
for ((i=1; i<=$number; i++)); do
    deployment_yaml=$(cat <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: nginx-$i
  namespace: default
  labels:
    app: nginx-$i
spec:
  containers:
    - name: nginx
      image: docker.io/library/nginx:latest
      imagePullPolicy: Never
      ports:
      - containerPort: 80
EOF
)
    clusteradm create work test$i -f - <<< "$deployment_yaml" --cluster cluster1
	
done
echo "All deployments created." >> number.txt
echo $(date +'%s.%N') >> number.txt