numberofpod=$1
result=$((numberofpod / 10))
LABEL_SELECTOR="vcluster.loft.sh/namespace=default"
NUM_PODS=$result # 修改為您的Pod數量
SLEEP_INTERVAL=1  # 檢查狀態的間隔時間（秒）

# 等待所有Pod都變成運行狀態
while true; do
    running_pods=$(kubectl --kubeconfig /root/kubeconfig.yaml get deployment --no-headers | wc -l)
    echo $running_pods
    if [ "$running_pods" -eq "$NUM_PODS" ]; then
        current_time=$(date +'%s.%N')
        echo timefordeployment >> timeforend.txt
        echo $current_time >> timeforend.txt
        break
    else
        sleep $SLEEP_INTERVAL
    fi
done