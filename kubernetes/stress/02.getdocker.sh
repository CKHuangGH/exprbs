number=$1
j=1
for i in $(cat node_exec)
do 

	scp root@$i:/root/kubetopPodDNS.csv /root/exprbs/kubernetes/stress/results/kubetopPodDNS.csv
	scp root@$i:/root/kubetopPodWA.csv /root/exprbs/kubernetes/stress/results/kubetopPodWA.csv
	scp root@$i:/root/kubetopPodRA.csv /root/exprbs/kubernetes/stress/results/kubetopPodRA.csv
	scp root@$i:/root/kubetopPodVC.csv /root/exprbs/kubernetes/stress/results/kubetopPodVC.csv
	scp root@$i:/root/kubetopPodKL.csv /root/exprbs/kubernetes/stress/results/kubetopPodKL.csv
	j=$((j+1))	
done
mv kubetopPodCM.csv /root/exprbs/kubernetes/stress/results/kubetopPodCM.csv
mv kubetopPodHUB.csv /root/exprbs/kubernetes/stress/results/kubetopPodHUB.csv
mv cross /root/exprbs/kubernetes/stress/results/cross
mv number.txt /root/exprbs/kubernetes/stress/results/number.txt
sleep 5
random_number=$((1 + $RANDOM))
scp -o StrictHostKeyChecking=no -r /root/exprbs/kubernetes/stress/results chuang@172.16.111.106:/home/chuang/results$number-$random_number

echo "-----------------------copy ok -------------------------------"

sleep 300
ssh -o StrictHostKeyChecking=no chuang@172.16.111.106 . /home/chuang/k8s_g5k/sdfcp/del.sh &