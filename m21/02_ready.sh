cluster=1
target="<cluster_name>"
replacement="cluster1"
for i in $(cat node_list)
do
    grep "clusteradm join" "temp${cluster}.sh" > "run${cluster}.sh"
    input_file="run${cluster}.sh"
    temp_file="temp_file.sh"

    sed "s/$target/$replacement/g" "$input_file" > "$temp_file"

    mv "$temp_file" "$input_file"

    bash < "$input_file" &
    echo $cluster
    if ((cluster % 50 == 0)); then
        echo "sleep 180secs..."
        sleep 180
    cluster=$((cluster+1))
done