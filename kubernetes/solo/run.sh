kubectl apply -f vcluster.yaml

kubectl get secret --all-namespaces -o json | jq -r '.items[] | select(.metadata.name == "external-managed-kubeconfig") | .data.kubeconfig' | base64 --decode > kubeconfig.yaml