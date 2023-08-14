numberofpod=$1
LABEL_SELECTOR="vcluster.loft.sh/namespace=default"
NUM_PODS=$numberofpod  # 修改為您的Pod數量
SLEEP_INTERVAL=1  # 檢查狀態的間隔時間（秒）

# 等待所有Pod都變成運行狀態
while true; do
    running_pods=$(kubectl get pods -A -l $LABEL_SELECTOR --field-selector=status.phase=Running --no-headers | wc -l)
    
    if [ "$running_pods" -eq "$NUM_PODS" ]; then
        current_time=$(date +'%s.%N')
        echo $current_time >> number.txt
        break
    else
        sleep $SLEEP_INTERVAL
    fi
done