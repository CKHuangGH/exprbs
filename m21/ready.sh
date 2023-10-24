for i in $(cat node_list)
do
    ssh root@$i grep "clusteradm join" temp.sh > run.sh
done