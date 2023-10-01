#!/bin/bash

# Define the label selector for the Pod to check
LABEL_SELECTOR="app=vcluster"

# Loop to check the Pod status continuously
while true; do
  # Use the kubectl command to check the status of Pods matching the label selector
  POD_STATUS=$(kubectl get pods -A -l $LABEL_SELECTOR -o jsonpath='{.items[0].status.phase}' 2>/dev/null)

  # If the Pod status is "Running," exit the loop
  if [ "$POD_STATUS" == "Running" ]; then
    echo "Pod is running"
    break
  else
    echo "Pod is not running, waiting..."
  fi

  # Wait for some time before checking again
  sleep 1
done

echo "Check completed, exiting the loop"