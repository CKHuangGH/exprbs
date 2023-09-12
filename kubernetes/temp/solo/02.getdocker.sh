number=$1
j=1

for i in $(cat node_exec)
do 
	ssh root@$i . /root/exprbs/kubernetes/solo/script/getlog.sh
	scp root@$i:/root/logs.txt /root/exprbs/kubernetes/solo/results/logs.txt
	scp root@$i:/root/kubetopPodDNS.csv /root/exprbs/kubernetes/solo/results/kubetopPodDNS.csv
	scp root@$i:/root/kubetopPodWA.csv /root/exprbs/kubernetes/solo/results/kubetopPodWA.csv
	scp root@$i:/root/kubetopPodRA.csv /root/exprbs/kubernetes/solo/results/kubetopPodRA.csv
	scp root@$i:/root/kubetopPodVC.csv /root/exprbs/kubernetes/solo/results/kubetopPodVC.csv
	scp root@$i:/root/kubetopPodKL.csv /root/exprbs/kubernetes/solo/results/kubetopPodKL.csv
	j=$((j+1))	
done
mv kubetopPodCM.csv /root/exprbs/kubernetes/solo/results/kubetopPodCM.csv
mv kubetopPodHUB.csv /root/exprbs/kubernetes/solo/results/kubetopPodHUB.csv
mv cross /root/exprbs/kubernetes/solo/results/cross
mv number.txt /root/exprbs/kubernetes/solo/results/number.txt
sleep 5
random_number=$((1 + $RANDOM))
scp -o StrictHostKeyChecking=no -r /root/exprbs/kubernetes/solo/results chuang@172.16.111.106:/home/chuang/results$number-$random_number

echo "-----------------------copy ok -------------------------------"

sleep 300
ssh -o StrictHostKeyChecking=no chuang@172.16.111.106 . /home/chuang/k8s_g5k/sdfcp/del.sh &