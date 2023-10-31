#!/bin/bash

# Loop through all files in the current directory
for file in *; do
    # Check if the file has a size of 0
    if [ -s "$file" ]; then
        continue
    fi

    # Extract numbers from the filename (assuming they are integers)
    numbers=$(echo "$file" | grep -o -E '[0-9]{1,3}')

    # Check if numbers were found in the filename
    if [ -n "$numbers" ]; then
        # Display the filename and extracted numbers
        echo "File: $file, Numbers: $numbers"
    else
        # If no numbers found, display a message
        echo "File: $file, No numbers found in the filename"
    fi
done