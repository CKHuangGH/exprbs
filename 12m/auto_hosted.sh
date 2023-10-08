#!/bin/bash
cluster=1
for i in $(cat node_list)
do
	target="<cluster_name>"
	replacement="cluster1"

	target2="--mode multi-mgt"
	replacement2="--mode hosted --managed-cluster-kubeconfig \/root\/.kube\/config "

	input_file="run.sh"

	temp_file="temp_file.sh"

	temp2_file="temp2_file.sh"

	newname="run${cluster}.sh"

	sed "s/$target/$replacement/g" "$input_file" > "$temp_file"

	sed "s/$target2/$replacement2/g" "$temp_file" > "$temp2_file"

	mv "$temp2_file" "$newname"
	
	ssh root@$i kubectl taint nodes --all node-role.kubernetes.io/control-plane:NoSchedule-
	ssh root@$i 'bash -s' < "$newname" &
	cluster=$((cluster+1))
done