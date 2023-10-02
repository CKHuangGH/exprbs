j=1
for i in $(cat node_exec)
do 
	scp root@$i:/root/number.txt /root/exprbs/kubernetes/failure/results/number.txt
	ssh root@$i . /root/exprbs/kubernetes/failure/show.sh
	j=$((j+1))	
done

mv number.txt /root/exprbs/kubernetes/failure/results/number.txt
sleep 5
random_number=$((1 + $RANDOM))
scp -o StrictHostKeyChecking=no -r /root/exprbs/kubernetes/failure/results chuang@172.16.111.106:/home/chuang/results-$random_number

echo "-----------------------copy ok -------------------------------"