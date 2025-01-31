
# 迴圈 500 次
for ((i=1; i<=1000; i++)); do
    deployment_yaml=$(cat <<EOF
apiVersion: v1
kind: Namespace
metadata:
  name: namespace-$i
EOF
)
    clusteradm create work namespace$i -f - <<< "$deployment_yaml" --cluster cluster1
	
done