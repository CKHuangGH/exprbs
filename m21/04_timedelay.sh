for i in $(cat node_list)
do
    ssh root@$i . /root/exprbs/m21/time.sh
done