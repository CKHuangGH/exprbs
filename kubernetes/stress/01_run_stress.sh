cp ../node_list node_list
cp ../node_list_all node_list_all
mkdir results

input_file="node_list_all"
output_file="node_exec"

if [ -f "$input_file" ]; then
    last_line=$(tail -n 1 "$input_file")
    
    echo "$last_line" > "$output_file"
    echo "save to $output_file"
else
    echo "fail to open $input_file"
fi

while read line
do 
echo $line
ip1=$(echo $line | cut -d "." -f 2)
ip2=$(echo $line | cut -d "." -f 3)
break
done < node_list_all

read -p "please enter the test number(2000, 4000, 6000, 8000, 10000): " number

. ./script/topcm.sh > /dev/null &
. ./script/tophub.sh > /dev/null &
j=1
for i in $(cat node_exec)
do 
	ssh root@$i . /root/exprbs/kubernetes/stress/script/getconfig.sh > /dev/null &
	ssh root@$i . /root/exprbs/kubernetes/stress/script/toppodwa.sh > /dev/null &
	ssh root@$i . /root/exprbs/kubernetes/stress/script/toppodvc.sh > /dev/null &
	ssh root@$i . /root/exprbs/kubernetes/stress/script/toppodra.sh > /dev/null &
	ssh root@$i . /root/exprbs/kubernetes/stress/script/toppodkl.sh > /dev/null &
	ssh root@$i . /root/exprbs/kubernetes/stress/script/toppoddns.sh > /dev/null &
	j=$((j+1))
done
tcpdump -i ens3 port 6443 -nn -q >> cross &

echo "waiting 180 secs"
sleep 180

echo $number
echo $number > number.txt
echo "start deployment" >> number.txt
echo $(date +'%s.%N') >> number.txt
. ./script/$number.sh > /dev/null &



g=1
for i in $(cat node_exec)
do 
    ssh root@$i . /root/exprbs/kubernetes/stress/checking_deployment.sh $number &
    ssh root@$i . /root/exprbs/kubernetes/stress/checking.sh $number
	g=$((g+1))
done


echo "wait for 3000 secs"
for (( i=3000; i>0; i-- )); do
    echo "$i ..."
    sleep 1
done

. 02.getdocker.sh $number