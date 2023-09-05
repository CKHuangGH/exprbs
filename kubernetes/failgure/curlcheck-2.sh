#!/bin/bash

# Set the URL of the Web application to check
web_app_url="https://your-web-app-url.com"

# Set the check interval (in seconds)
check_interval=0.2

# Create a file to store the Web application's status
status_file="/tmp/web_app_status"

# Start an infinite loop
while true; do
    # Check if the Web application is running normally
    response_code=$(curl -s -o /dev/null -w "%{http_code}" "$web_app_url")

    if [ "$response_code" == "200" ]; then
        if [ -f "$status_file" ]; then
            # Web application has resumed operation
            end_time=$(date +%s)
            start_time=$(cat "$status_file")
            interrupted_time=$((end_time - start_time))
            echo "Web application has resumed, interruption time was $interrupted_time seconds."
            rm "$status_file"
        fi
    else
        # Web application is interrupted
        if [ ! -f "$status_file" ]; then
            # Record the start time of the interruption
            date +%s > "$status_file"
            echo "Web application is interrupted, please wait for recovery..."
        fi
    fi

    # Wait for a while before checking again
    sleep "$check_interval"
done