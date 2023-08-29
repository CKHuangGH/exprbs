#!/bin/bash

target="<cluster_name>"
replacement="cluster1"

target2="--mode multi-mgt"
replacement2="--mode hosted --kubeconfig /root/.kube/cluster1"

input_file="run.sh"

temp_file="temp_file.sh"

temp2_file="temp2_file.sh"

sed "s/$target/$replacement/g" "$input_file" > "$temp_file"

sed "s/$target2/$replacement2/g" "$temp_file" > "$temp2_file"

mv "$temp2_file" "$input_file"

for i in $(cat node_list)
do
	ssh root@$i 'bash -s' < run.sh
done

clusteradm accept --clusters cluster1