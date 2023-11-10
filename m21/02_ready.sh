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
        sed -n "${start},${cluster}p" "$file_path" | while IFS= read -r line; do
        # 在这里执行你想要的操作，例如输出每一行的内容
            echo "Processing line: $line"
            ssh root@$line clusteradm accept --clusters "cluster1"
        done
        start=$cluster
    else
        bash < "$input_file" &
    fi
    cluster=$((cluster+1))
done