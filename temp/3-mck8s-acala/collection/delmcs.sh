number=$1
docker ps --format "{{.Names}}" | grep k8s_mcs_multiclusterscheduler > name
for i in $(cat name)
do
    docker cp $i:/logs.csv /root/exprbs/3-mck8s-acala/collection/results/logs$number.csv
done

mcsname=$(kubectl get pod -o custom-columns=NAME:.metadata.name | grep multiclusterscheduler)
kubectl delete pod $mcsname
