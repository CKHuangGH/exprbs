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

cp ../node_list_all node_list_all

while read line
do 
echo $line
ip1=$(echo $line | cut -d "." -f 2)
ip2=$(echo $line | cut -d "." -f 3)
break
done < node_list_all

sleep 3
random_number=$((1 + $RANDOM))
scp -o StrictHostKeyChecking=no -r /root/exprbs/kubernetes/stress/results chuang@172.16.111.106:/home/chuang/results$random_number

echo "-----------------------copy ok -------------------------------"