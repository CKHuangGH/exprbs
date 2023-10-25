#!/bin/bash
sh /root/exprbs/m21/check.sh
for i in $(cat node_list)
do
    ssh root@$i kubectl taint nodes --all node-role.kubernetes.io/control-plane:NoSchedule-
	ssh root@$i sh /root/exprbs/m21/check.sh &
done

sleep 10

cluster=1
for i in $(cat node_list)
do
    ssh root@$i clusteradm init --wait > "temp${cluster}.sh" &
    cluster=$((cluster+1))
done

./number.sh
# sleep 60

# cluster=1
# for i in $(cat node_list)
# do
# 	ssh root@$i sh /root/exprbs/m21/ready.sh $cluster
#     cluster=$((cluster+1))
# done