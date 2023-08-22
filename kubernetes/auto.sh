#!/bin/bash

# 设置要查找和替换的目标字符串
target="<cluster_name>"
replacement="cluster1"

# 输入文件的路径
input_file="run.sh"

# 创建一个临时文件来保存修改后的内容
temp_file="temp_file.sh"

# 使用sed命令进行查找和替换，并将结果写入临时文件
sed "s/$target/$replacement/g" "$input_file" > "$temp_file"

# 将临时文件的内容复制回原始文件
mv "$temp_file" "$input_file"

for i in $(cat node_list)
do
	ssh root@$i 'bash -s' < run.sh
done

clusteradm accept --clusters cluster1