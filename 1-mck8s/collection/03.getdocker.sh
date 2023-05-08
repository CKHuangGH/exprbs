j=1
for i in $(cat node_list)
do 
    #ssh -o StrictHostKeyChecking=no root@$i . /root/mck8s_vm/large-scale/large/script/dockergetime.sh
    #scp root@$i:/root/exectime /root/mck8s_vm/large-scale/large/results/exectime_cluster$j
	scp root@$i:/root/kubetopNodecluster$j.csv /root/exprbs/1-mck8s/collection/results/kubetopNodecluster$j.csv
	#scp root@$i:/root/kubetopPodMcluster$j.csv /root/exprbs/1-mck8s/collection/results/kubetopPodMcluster$j.csv
	scp root@$i:/root/kubegetpodcluster$j.csv /root/exprbs/1-mck8s/collection/results/kubegetpodcluster$j.csv
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

mv kubetopPodD.csv /root/exprbs/1-mck8s/collection/results/kubetopPodD.csv
mv kubetopPodKS.csv /root/exprbs/1-mck8s/collection/results/kubetopPodKS.csv
mv kubetopPodKF.csv /root/exprbs/1-mck8s/collection/results/kubetopPodKF.csv
mv kubetopNodecluster0.csv /root/exprbs/1-mck8s/collection/results/kubetopNodecluster0.csv
mv kubetopPodMcluster0.csv /root/exprbs/1-mck8s/collection/results/kubetopPodMcluster0.csv
mv cross /root/exprbs/1-mck8s/collection/results/cross
mv prom_scrape_acala /root/exprbs/1-mck8s/collection/results/prom_scrape_acala
mv multi_cluster_scheduling_logs* results/
mv /root/member /root/exprbs/1-mck8s/collection/results/member

sleep 3
random_number=$((1 + $RANDOM))
scp -o StrictHostKeyChecking=no -r /root/exprbs/1-mck8s/collection/results chuang@172.16.111.106:/home/chuang/results$random_number

echo "-----------------------copy ok -------------------------------"