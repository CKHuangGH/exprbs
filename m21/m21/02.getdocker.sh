number=$1
j=1

mv kubetopPodks.csv /root/exprbs/m21/m21/results/kubetopPodks.csv
mv cross /root/exprbs/m21/m21/results/cross
mv number.txt /root/exprbs/m21/m21/results/number.txt
sleep 5
random_number=$((1 + $RANDOM))
scp -o StrictHostKeyChecking=no -r /root/exprbs/m21/m21/results chuang@172.16.111.106:/home/chuang/results$number-$random_number

echo "-----------------------copy ok -------------------------------"

sleep 300
ssh -o StrictHostKeyChecking=no chuang@172.16.111.106 . /home/chuang/k8s_g5k/sdfcp-m21/del.sh &