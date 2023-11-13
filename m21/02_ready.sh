cluster=1
start=1
target="<cluster_name>"
replacement="cluster1"
for i in $(cat node_list)
do
    grep "clusteradm join" "temp${cluster}.sh" > "run${cluster}.sh"
    input_file="run${cluster}.sh"
    temp_file="temp_file.sh"

    sed "s/$target/$replacement/g" "$input_file" > "$temp_file"

    mv "$temp_file" "$input_file"

    
    echo $cluster
    if ((cluster % 20 == 0)); then
        bash < "$input_file"
        sleep 60
        cluster2=$((cluster+1))
        for ((i=$start; i<=$cluster; i++)); do
            current_line=$(sed -n "${i}p" "node_list")
            echo "Processing line: $current_line"
            ssh root@$current_line clusteradm accept --clusters "cluster1"
        done
        sleep 60
        start=$cluster
    else
        bash < "$input_file" &
    fi
    cluster=$((cluster+1))
    
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