cluster=1
for i in $(cat node_list)
do
    clusteradm accept --clusters "cluster${cluster}"
    cluster=$((cluster+1))
done
echo "wait 10 secs"
sleep 10
kubectl get ns --no-headers | wc -l