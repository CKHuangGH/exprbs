#!/bin/bash

# Get the desired count of files from user input
desired_count=$(cat node_list | wc -l)
echo "Number of desired files: $desired_count"
# Continuously check if the number of files matches the user's input
while true; do
  current_count=$(find . -maxdepth 1 -type f -name "temp*" | wc -l)
  echo "Number of temp files: $current_count"

  if [ "$current_count" -eq "$desired_count" ]; then
    echo "The number of files has reached the specified count of $desired_count. Ending the check."
    break
  else
    sleep 1  # Pause for 1 second before checking again
  fi
done