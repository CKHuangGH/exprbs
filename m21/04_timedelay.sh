for i in $(cat node_list)
do
    ssh root@$i . /root/exprbs/m21/time.sh
done

while read -r ip; do
    # 忽略空行和注释行
    if [[ "$ip" =~ ^[[:space:]]*$ || "$ip" =~ ^\s*# ]]; then
        continue
    fi

    ping_output=$(ping -c 2 "$ip")

    # 解析ping的结果，找到平均延迟时间
    avg_latency=$(echo "$ping_output" | grep -oE "avg[[:space:]]*=[[:space:]]*[0-9.]+/[0-9.]+/[0-9.]+/[0-9.]+" | cut -d'/' -f2)

    # 检查延迟时间是否大于70毫秒
    if (( $(bc <<< "$avg_latency < 70") )); then
        echo "平均延迟时间小于70 ms:$avg_latency ms"
        echo "$ip"
    fi
done < "node_list"