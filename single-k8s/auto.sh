#!/bin/bash

target="<cluster_name>"
replacement="cluster1"

input_file="run.sh"

temp_file="temp_file.sh"

sed "s/$target/$replacement/g" "$input_file" > "$temp_file"

mv "$temp_file" "$input_file"

for i in $(cat node_list)
do
	ssh root@$i 'bash -s' < run.sh
done

clusteradm accept --clusters cluster1