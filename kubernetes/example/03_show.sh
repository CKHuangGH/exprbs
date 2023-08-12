clusteradm get works --cluster cluster1
echo "-----------------------namespace-----------------------"
kubectl get namespace --context kind-member0
echo "-----------------------pod-----------------------"
kubectl get pod -A --context kind-member0
echo "-----------------------service-----------------------"
kubectl get service -A --context kind-member0
echo "-----------------------endpoint-----------------------"
kubectl get endpoint -A --context kind-member0
echo "-----------------------ingresses-----------------------"
kubectl get ingresses -A- -context kind-member0
echo "-----------------------pv-----------------------"
kubectl get pv --context kind-member0
echo "-----------------------pvc-----------------------"
kubectl get pvc -A --context kind-member0
echo "-----------------------configmap-----------------------"
kubectl get configmap -A --context kind-member0
echo "-----------------------secret-----------------------"
kubectl get secret -A --context kind-member0
echo "-----------------------storageclass-----------------------"
kubectl get storageclass --context kind-member0