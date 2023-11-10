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
    if ((cluster % 50 == 0)); then
        sleep 60
        bash < "$input_file"
        cluster2=$((cluster+1))
        sed -n "${start},${cluster2}p" "node_list" | while IFS= read -r line; do
            echo "Processing line: $line"
            ssh root@$line clusteradm accept --clusters "cluster1"
        done
        start=$cluster
    else
        bash < "$input_file" &
    fi
    cluster=$((cluster+1))
done