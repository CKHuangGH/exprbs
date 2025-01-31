LABEL_SELECTOR="vcluster.loft.sh/namespace=default"
NUM_PODS=12 
SLEEP_INTERVAL=1

while true; do
    running_pods=$(kubectl get pod --no-headers | wc -l)
    echo "deployment: "$running_pods
    if [ "$running_pods" -eq "$NUM_PODS" ]; then
        current_time=$(date +'%s.%N')
        echo timefordeployment >> number.txt
        echo $current_time >> number.txt
    else
        sleep $SLEEP_INTERVAL
    fi
done