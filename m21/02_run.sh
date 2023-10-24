for i in $(cat node_list)
do
    ssh root@$i grep "clusteradm join" temp.sh > run.sh
	ssh root@$i sh /root/exprbs/m21/auto.sh
done
cluster=1
for i in $(cat node_list)
do
    scp root@$i:/root/run1.sh /root/"run${cluster}.sh"
	'bash -s' < "run${cluster}.sh" &
	cluster=$((cluster+1))
done