namespace="kube-system"

# Get the status of all Pods in the namespace
pod_status=$(kubectl get pods -n $namespace -o jsonpath='{.items[*].status.phase}')

# Check for any non-running Pods
if [[ $pod_status == *"Pending"* || $pod_status == *"CrashLoopBackOff"* || $pod_status == *"Error"* ]]; then
  echo "$pod_status status"
  kubectl get node
  helm uninstall cilium -n kube-system
  helm install cilium cilium/cilium --version 1.13.4 --wait --wait-for-jobs --namespace kube-system --set operator.replicas=1
else
  echo "All Pods are running."
fi