read -p "please enter the number of cluster: " number
for i in {1..$number}
do
  ns="cluster$i"
  kubectl get ns $ns &>/dev/null
  if [ $? -ne 0 ]; then
    echo "缺少命名空间: $ns"
	awk "NR==$ns" node_list
  fi
done