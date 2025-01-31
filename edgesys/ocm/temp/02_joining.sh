ls /root/.kube/
read -p "please enter the last cluster number in .kube: " cluster

for i in `seq 1 $cluster`
do
kubefedctl join cluster$i --cluster-context cluster$i --host-cluster-context cluster0 --v=2
done