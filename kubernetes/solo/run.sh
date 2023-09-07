vcluster create vcluster-0 --chart-version v0.15.5

kubectl get secret --all-namespaces -o json | jq -r '.items[] | select(.metadata.name == "external-managed-kubeconfig") | .data.kubeconfig' | base64 --decode > kubeconfig.yaml