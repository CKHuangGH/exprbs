number=$1
j=1

mv kubetopPodks.csv /root/exprbs/12m/12m/results/kubetopPodks.csv
mv cross /root/exprbs/12m/12m/results/cross
mv number.txt /root/exprbs/12m/12m/results/number.txt
sleep 5
random_number=$((1 + $RANDOM))
scp -o StrictHostKeyChecking=no -r /root/exprbs/12m/12m/results chuang@172.16.111.106:/home/chuang/results$number-$random_number

echo "-----------------------copy ok -------------------------------"

sleep 300
ssh -o StrictHostKeyChecking=no chuang@172.16.111.106 . /home/chuang/k8s_g5k/sdfcp-12m/del.sh &