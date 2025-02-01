cluster=1
for i in $(cat node_list)
do
    clusteradm create work deployment-test -f deployment.yaml --clusters cluster${cluster}
    cluster=$((cluster+1))
done