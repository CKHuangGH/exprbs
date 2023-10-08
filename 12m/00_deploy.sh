cp node_list node_list_all
sed -i '1d' node_list
mv node_list ./mcluster_example/node_list
ls /root/.kube/
read -p "please enter the last cluster number in .kube: " number

./combineAll.sh $number
echo "wait 30s"
sleep 30
./cicd_clusteradm.sh
echo "wait 30s"




kubectl get pod -A
kubectl get pod -A --context cluster1
kubectl get node -A | wc -l
kubectl get node -A --context cluster1 | wc -l

kubectl get pod -A -l app=klusterlet-manifestwork-agent --context cluster1
kubectl get pod -A -l app=vcluster --context cluster1