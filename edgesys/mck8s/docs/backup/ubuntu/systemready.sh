##update and upgrade
sudo apt-get update 
sudo apt-get upgrade -y

## install vim
sudo apt-get install vim -y

##disable firewall
sudo ufw disable 

##install docker
sudo apt-get -y install ca-certificates curl gnupg lsb-release
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sleep 5

##change docker volume location
echo -e '{\n"data-root": "/tmp/"\n}' >> /etc/docker/daemon.json
service docker restart


## install go, kind, kubectl
sudo apt-get install golang -y
GO111MODULE="on" go get sigs.k8s.io/kind@v0.11.1
mv /root/go/bin/kind /usr/bin/kind
curl -LO https://dl.k8s.io/release/v1.18.0/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/bin/kubectl
mkdir -p ~/.kube

##pull docker images
docker pull kindest/node:v1.18.0
docker pull chuangtw/mcs
docker pull chuangtw/mchpa 
docker pull nginx