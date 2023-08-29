cp node_list node_list_all
sed -i '1d' node_list
ls /root/.kube/
read -p "please enter the last cluster number in .kube: " number

./combineAll.sh $number


echo "Good 2 check"

kubectl get pod -A
kubectl get node -A | wc -l