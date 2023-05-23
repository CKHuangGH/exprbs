cp node_list node_list_all
sed -i '1d' node_list
#ls /root/.kube/
#read -p "please enter the last cluster number in .kube: " number

./promvalue.sh
./combineAll.sh 5
./mck8s-management.sh

sleep 40
./02_joining.sh