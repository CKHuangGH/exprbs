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

    'bash -s' < "$input_file" &
    cluster=$((cluster+1))
done