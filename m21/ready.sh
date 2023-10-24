cluster=$1

namespace="open-cluster-management-hub"

# Get the status of all Pods in the namespace
pod_status=$(kubectl get pods -n $namespace -o jsonpath='{.items[*].status.phase}')

# Check for any non-running Pods
if [[ $pod_status == *"Pending"* || $pod_status == *"CrashLoopBackOff"* || $pod_status == *"Error"* ]]; then
  echo "There are non-running Pods. Take appropriate action."
  clusteradm clean
  sleep 10
  clusteradm init --wait > "temp$cluster.sh"
  scp "temp$cluster.sh" 
else
  echo "All Pods are running."
fi