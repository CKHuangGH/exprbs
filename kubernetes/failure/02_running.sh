cp ../node_list node_list
cp ../node_list_all node_list_all
mkdir results

input_file="node_list_all"
output_file="node_exec"

if [ -f "$input_file" ]; then
    last_line=$(tail -n 1 "$input_file")
    
    echo "$last_line" > "$output_file"
    echo "save to $output_file"
else
    echo "fail to open $input_file"
fi

j=1
for i in $(cat node_exec)
do 
	ssh root@$i . /root/exprbs/kubernetes/failure/checking.sh &
	for ((q=1; q<=100; q++)); 
	do	
		ssh root@$i echo "$q start del" >> number.txt
		ssh root@$i echo $(date +'%s.%N') >> number.txt
		ssh root@$i kubectl delete pod -A -l app=vcluster
		ssh root@$i echo "$q del end" >> number.txt
		ssh root@$i echo $(date +'%s.%N') >> number.txt
		ssh root@$i . /root/exprbs/kubernetes/failure/checking-vc.sh
	done
	j=$((j+1))
done
sleep 5
echo "kubectl get pods -A -l vcluster.loft.sh/namespace=default"
kubectl get pods -A -l vcluster.loft.sh/namespace=default
echo "kubectl get events -A --field-selector involvedObject.name=vcluster-0 --no-headers | grep Killing | grep Stopping.container.vcluster | wc -l"
kubectl get events -A --field-selector involvedObject.name=vcluster-0 --no-headers | grep Killing | grep Stopping.container.vcluster | wc -l 
. 03.getdocker.sh