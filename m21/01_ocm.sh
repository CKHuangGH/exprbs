#!/bin/bash

for i in $(cat node_list)
do
    ssh root@$i kubectl taint nodes --all node-role.kubernetes.io/control-plane:NoSchedule-
done

sleep 10

for i in $(cat node_list)
do
    ssh root@$i clusteradm init --wait > temp.sh &
done