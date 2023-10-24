for i in $(cat node_list)
do
    ssh root@$i clusteradm accept --clusters "cluster1"
done
echo "wait 10 secs"
sleep 10
#!/bin/bash

# Retrieve information for all pods in the entire cluster
PODS=$(kubectl get pods -A -o json)

# Use jq to parse the JSON data and filter for pods with the "vcluster" label
VC_PODS=$(echo $PODS | jq '.items[] | select(.metadata.labels.vcluster=="true")')

# Calculate the count of vCluster pods
VC_POD_COUNT=$(echo $VC_PODS | jq '. | length')

# Print the result
echo "There are $VC_POD_COUNT vCluster pods in the entire Kubernetes cluster."
