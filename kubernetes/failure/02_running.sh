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
	for ((q=1; q<=1; q++)); 
	do	
		echo "start del" >> number.txt
		ssh root@$i  kubectl delete pod -A -l app=vcluster
		ssh root@$i . /root/exprbs/kubernetes/failure/checking.sh
	done
	j=$((j+1))
done

echo $(date +'%s.%N') >> number.txt
. ./script/$number.sh > /dev/null &



g=1
for i in $(cat node_exec)
do 
    ssh root@$i . /root/exprbs/kubernetes/stress/checking.sh $number
	g=$((g+1))
done


echo "wait for 3000 secs"
for (( i=3000; i>0; i-- )); do
    echo "$i ..."
    sleep 1
done

. 02.getdocker.sh $number