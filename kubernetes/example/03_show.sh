echo "-----------------------namespace-----------------------"
kubectl get namespace --context kind-member0
echo "-----------------------job-----------------------"
kubectl get job --context kind-member0
echo "-----------------------pod-----------------------"
kubectl get pod --context kind-member0
echo "-----------------------deployment-----------------------"
kubectl get deployment --context kind-member0
echo "-----------------------service-----------------------"
kubectl get service --context kind-member0
echo "-----------------------endpoint-----------------------"
kubectl get endpoint --context kind-member0
echo "-----------------------ingresses-----------------------"
kubectl get ingresses --context kind-member0
echo "-----------------------pv-----------------------"
kubectl get pv --context kind-member0
echo "-----------------------pvc-----------------------"
kubectl get pvc --context kind-member0
echo "-----------------------configmap-----------------------"
kubectl get configmap --context kind-member0
echo "-----------------------secret-----------------------"
kubectl get secret --context kind-member0
echo "-----------------------storageclass-----------------------"
kubectl get storageclass --context kind-member0