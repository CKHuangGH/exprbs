kubectl get node
kubectl get pod
echo "--------------------------------------------------"
for i in $(cat node_list)
do
	ssh -o StrictHostKeyChecking=no root@$i kubectl get node
	ssh -o StrictHostKeyChecking=no root@$i kubectl get pod
	echo "--------------------------------------------------"
done

echo "good to start run experiment-----------------------------------------------"
echo "go to large folder and change the 01_deploy.sh-----------------------------------------------"