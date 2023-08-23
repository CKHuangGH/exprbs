cp node_list node_list_all
sed -i '1d' node_list
ls /root/.kube/
read -p "please enter the last cluster number in .kube: " number

./combineAll.sh $number
echo "wait 30s"
sleep 30
./01_cicd_clusteradm.sh
echo "wait 30s"
sleep 30
./02_ocm.sh
echo "wait 30s"
sleep 30
cd stress/
echo "Good2run"

# mkdir /root/.kube/temp
# mv /root/.kube/config /root/.kube/temp/config
# mv /root/.kube/cluster0 /root/.kube/config