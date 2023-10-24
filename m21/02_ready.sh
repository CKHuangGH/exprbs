for i in $(cat node_list)
do
    ssh root@$i grep "clusteradm join" temp.sh > run.sh
	ssh root@$i sh /root/exprbs/m21/ready.sh
done