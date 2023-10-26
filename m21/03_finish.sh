for i in $(cat node_list)
do
    ssh root@$i clusteradm accept --clusters "cluster1"
done
echo "wait 10 secs"
sleep 10

kubectl get pod -A |grep vcluster-0 |wc -l
sleep 10
kubectl get pod -A |grep work-agent |wc -l