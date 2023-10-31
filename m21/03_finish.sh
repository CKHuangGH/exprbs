for i in $(cat node_list)
do
    ssh root@$i clusteradm accept --clusters "cluster1"
done
echo "wait 10 secs"
sleep 10

for i in $(cat node_list)
do
	echo $i
    ssh root@$i kubectl get pod -A | awk '$3 != "Running" {print $0}'
done

kubectl get pod -A |grep vcluster-0 |wc -l
kubectl get pod -A |grep work-agent |wc -l
kubectl get pod -A | awk '$3 != "Running" {print $0}'