cluster=1
for i in $(cat node_list)
do
    kubectl config use-context cluster$cluster
	helm repo update
	helm install cilium cilium/cilium --version 1.13.4 --wait --wait-for-jobs --namespace kube-system --set cluster.name=cluster$cluster --set cluster.id=$cluster --set operator.replicas=1
	cluster=$((cluster+1))
done