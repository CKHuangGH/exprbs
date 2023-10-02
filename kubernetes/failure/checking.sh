LABEL_SELECTOR="vcluster.loft.sh/namespace=default"
NUM_PODS=11
SLEEP_INTERVAL=1
first_time=true
while true; do
    running_pods=$(kubectl get pods -A -l vcluster.loft.sh/namespace=default --field-selector=status.phase=Running --no-headers | wc -l)
    #echo "deployment: "$running_pods
    if [ "$running_pods" -eq "$NUM_PODS" ]; then
        sleep $SLEEP_INTERVAL
    else
		if $first_time; then
			first_time=false
			echo "some problem" >> number.txt
			echo "$running_pods" >> number.txt
			echo $(date +'%s.%N') >> number.txt
		else
			sleep $SLEEP_INTERVAL
		fi
	fi
done