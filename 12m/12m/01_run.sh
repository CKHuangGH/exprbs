cp ../node_list node_list
cp ../node_list_all node_list_all
mkdir results

while read -r ip; do
    # 忽略空行和注释行
    if [[ "$ip" =~ ^[[:space:]]*$ || "$ip" =~ ^\s*# ]]; then
        continue
    fi

    # 执行ping命令
    ping -c 4 "$ip" >> number.txt  # 这里的-c 4表示ping 4次，您可以根据需要更改
done < "node_list"

. ./script/topapi.sh > /dev/null &

tcpdump -i ens3 port 6443 -nn -q >> cross &

echo "waiting 180 secs......."
sleep 180
echo "start collect" >> number.txt
echo $(date +'%s.%N') >> number.txt

echo "wait for 9000 secs"
for (( i=9000; i>0; i-- )); do
    echo "$i secs..."
    sleep 1
done
echo $(date +'%s.%N') >> number.txt
. 02.getdocker.sh $number