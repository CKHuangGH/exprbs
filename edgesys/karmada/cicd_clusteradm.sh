#!/bin/bash

kubectl config use-context cluster0
for i in $(cat node_list)
do
	ssh root@$i rm -rf /usr/local/bin/clusteradm
done

rm -rf /usr/local/bin/clusteradm

rm -rf clusteradm

curl -s https://raw.githubusercontent.com/karmada-io/karmada/master/hack/install-cli.sh | sudo bash -s kubectl-karmada

cp kubectl-karmada /usr/local/bin/kubectl-karmada
cd ..
for i in $(cat node_list)
do
	scp /root/go/bin/clusteradm root@$i:/usr/local/bin/ &
done