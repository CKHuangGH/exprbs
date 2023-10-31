#!/bin/bash

# Loop through all files in the current directory
for file in *; do
    # Check if the file has a size of 0
    if [ -s "$file" ]; then
        continue
    fi
    
    # Display the filename for files with a size of 0
    echo "$file"
done