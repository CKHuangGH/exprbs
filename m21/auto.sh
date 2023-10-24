#!/bin/bash
target="<cluster_name>"
replacement="cluster1"

input_file="run.sh"
newname="run1.sh"
temp_file="temp_file.sh"

sed "s/$target/$replacement/g" "$input_file" > "$temp_file"

mv "$temp_file" "$newname"