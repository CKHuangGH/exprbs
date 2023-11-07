for i in $(cat node_list)
do
    ssh root@$i clusteradm accept --clusters "cluster1"
done
echo "wait 10 secs"

seconds=60

# 開始倒數
for i in $(seq $seconds); do
  # 輸出倒數計數
  echo "剩餘 $i 秒"
  # 延遲 1 秒
  sleep 1
done

for i in $(cat node_list)
do
	echo $i
    ssh root@$i kubectl get pods -A  --field-selector status.phase!=Running
done

echo "number of vcluster" 
kubectl get pod -A |grep vcluster-0 |wc -l
echo "number of work-agent" 
kubectl get pod -A |grep work-agent |wc -l

kubectl get pods -A  --field-selector status.phase!=Running