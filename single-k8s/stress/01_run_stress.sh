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

read -p "please enter the test number(2000, 4000, 6000, 8000, 10000): " number

echo $number
echo $number > number.txt
echo "start deployment" >> number.txt
echo $(date +'%s.%N') >> number.txt
. ./script/$number.sh > /dev/null &

. ./checking_deployment.sh $number &
. ./checking.sh $number
g=1

echo "wait for 180 secs"
for (( i=180; i>0; i-- )); do
    echo "$i ..."
    sleep 1
done

. 02.getdocker.sh $number