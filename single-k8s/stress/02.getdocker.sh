number=$1
j=1

mv number.txt /root/exprbs/kubernetes/stress/results/number.txt
sleep 5
random_number=$((1 + $RANDOM))
scp -o StrictHostKeyChecking=no -r /root/exprbs/kubernetes/stress/results chuang@172.16.111.106:/home/chuang/results$number-$random_number

echo "-----------------------copy ok -------------------------------"