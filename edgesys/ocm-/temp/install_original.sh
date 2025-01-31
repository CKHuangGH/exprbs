for i in $(cat node_list)
do
ssh root@i curl -L https://raw.githubusercontent.com/open-cluster-management-io/clusteradm/main/install.sh | bash
done

curl -L https://raw.githubusercontent.com/open-cluster-management-io/clusteradm/main/install.sh | bash