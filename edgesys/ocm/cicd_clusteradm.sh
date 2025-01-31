#!/bin/bash

kubectl config use-context cluster0
for i in $(cat node_list)
do
	ssh root@$i rm -rf /usr/local/bin/clusteradm
done

rm -rf /usr/local/bin/clusteradm

rm -rf clusteradm

curl -L https://raw.githubusercontent.com/open-cluster-management-io/clusteradm/main/install.sh | bash

# cp /root/go/bin/clusteradm /usr/local/bin/clusteradm
cd ..
for i in $(cat node_list)
do
	scp /usr/local/bin/clusteradm root@$i:/usr/local/bin/ &
done