#!/bin/bash
. /root/exprbs/m21/check_main.sh
for i in $(cat node_list)
do
    ssh root@$i kubectl taint nodes --all node-role.kubernetes.io/control-plane:NoSchedule-
	ssh root@$i . /root/exprbs/m21/check.sh
done

sleep 10

cluster=1
for i in $(cat node_list)
do
    ssh root@$i clusteradm init --wait > "temp${cluster}.sh" &
    sleep 1
    cluster=$((cluster+1))
done
sleep 60
./number.sh

REVISION=$(ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/peer.crt --key=/etc/kubernetes/pki/etcd/peer.key endpoint status --write-out="json" | egrep -o '"revision":[0-9]*' | egrep -o '[0-9].*')
ETCDCTL_API=3 etcdctl \
	--endpoints=https://127.0.0.1:2379 \
	--cacert=/etc/kubernetes/pki/etcd/ca.crt \
	--cert=/etc/kubernetes/pki/etcd/peer.crt \
	--key=/etc/kubernetes/pki/etcd/peer.key \
	compact ${REVISION}
ETCDCTL_API=3 etcdctl \
	--endpoints=https://127.0.0.1:2379 \
	--cacert=/etc/kubernetes/pki/etcd/ca.crt \
	--cert=/etc/kubernetes/pki/etcd/peer.crt \
	--key=/etc/kubernetes/pki/etcd/peer.key \
	defrag

# sleep 60

# cluster=1
# for i in $(cat node_list)
# do
# 	ssh root@$i sh /root/exprbs/m21/ready.sh $cluster
#     cluster=$((cluster+1))
# done