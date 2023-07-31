#!/bin/bash

kubectl config use-context cluster0
for i in $(cat node_list)
do
	ssh root@$i rm -rf /usr/local/bin/clusteradm
done

rm -rf /usr/local/bin/clusteradm

rm -rf clusteradm_mmc/

git clone https://github.com/CKHuangGH/clusteradm_mmc.git
chmod 777 clusteradm_mmc/
cd clusteradm_mmc/
make build

cp /root/go/bin/clusteradm /usr/local/bin/clusteradm
cd ..
for i in $(cat node_list)
do
	scp /root/go/bin/clusteradm root@$i:/usr/local/bin/
done