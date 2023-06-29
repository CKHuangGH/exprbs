# Select the latest version of HNC
HNC_VERSION=v1.1.0

# Select the variant of HNC you like. Other than 'default', options include:
# 'hrq': Like default, but with hierarchical quotas.
# 'ha': Like default, but with two deployments: one single-pod for the controller, and one three-pod for the webhooks
# 'default-cm': Like default, but without the built-in cert rotator, and with support for cert-manager
HNC_VARIANT=default

# Install HNC. Afterwards, wait up to 30s for HNC to refresh the certificates on its webhooks.
kubectl apply -f https://github.com/kubernetes-sigs/hierarchical-namespaces/releases/download/${HNC_VERSION}/${HNC_VARIANT}.yaml 

# Ensure HNC_VERSION is set as above
HNC_PLATFORM=linux_amd64 # also supported: linux_arm64, darwin_amd64, darwin_arm64, windows_amd64
curl -L https://github.com/kubernetes-sigs/hierarchical-namespaces/releases/download/${HNC_VERSION}/kubectl-hns_${HNC_PLATFORM} -o ./kubectl-hns
chmod +x ./kubectl-hns
mv kubectl-hns /usr/local/bin/kubectl-hns

# Ensure the plugin is working
kubectl-hns
# The help text should be displayed