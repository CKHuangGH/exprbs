#!/bin/bash

# 使用命令替换将命令输出存储到变量中
namespaces=$(kubectl get namespace | grep -E '^mgt' | awk '{print $1}')

# 打印存储的命名空间列表
echo "匹配的命名空间列表："
echo "$namespaces"

echo "kubectl get pods -n $namespaces"
kubectl get pods -n $namespaces
echo "kubectl get events -A --field-selector involvedObject.name=vcluster-0 --no-headers | grep Killing | grep Stopping.container.vcluster | wc -l"
kubectl get events -A --field-selector involvedObject.name=vcluster-0 --no-headers | grep Killing | grep Stopping.container.vcluster | wc -l 