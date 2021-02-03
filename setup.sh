# start minikube
minikube start --driver=docker

# get minikube (true) ip
CLUSTER_IP="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"

# deploy metallb
# add "> /dev/null" to remove info in stdout 
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl apply -f metallb-config.yaml

# config secret for metallb
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# mettre les images en local et a jour :
# eval $(minikube -p minikube docker-env)

# installer filezilla pour ftps
sudo apt install filezilla
