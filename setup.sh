#! /bin/bash

printf "\n\t\tWelcome to ft_services's project!\n\n"

# before launching
printf "please before launching be aware that :\n\n"
printf "\-this project can only be launched with the VM provided by 42\n"
printf "\-nginx is turned off\n"
printf "\-you're VM got at least 2 core\n"
printf "\-docker got sudo right (sudo usermod -aG docker $(whoami) then deco-reco)\n\n"
printf "if not press Ctrl-c to make the change\n\n"

read -n1 -s -r -p $'else press any key to proceed...' key
if [ "$key" = ' ' ]; then
break
fi

sleep 1
# minikube clean
printf "\n\n========>Cleaning Minikube!<===========\n\n\n"
minikube delete

# start minikube
printf "\n\n========>Launching Minikube!<===========\n\n\n"
minikube start --driver=docker

# get minikube (true) ip
CLUSTER_IP="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"

# deploy metallb
# add "> /dev/null" to remove info in stdout 
# attention a l'ordre!!
printf "\n\n========>Deploying Metallb<===========\n\n\n"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml 2> /dev/null
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml 2> /dev/null
kubectl apply -f metallb-config.yaml 2> /dev/null
# config secret for metallb
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" 2> /dev/null

# mettre les images en local et a jour :
printf "\n\n========>Linking docker's images to minikube<===========\n\n"
eval $(minikube -p minikube docker-env)
printf "done!\n\n"

# installer filezilla pour ftps
printf "=====>Installing Filezilla to check ftps server (Or maybe is it a virus mouahah)<====\n"
sudo apt install filezilla

printf "\n\n========>Building docker's images (see you in two years)<===========\n\n"
printf "building nginx image...\n"
docker build -t nginx nginx/ &> /dev/null
printf "image built!\n\n"
printf "building grafana image...\n"
docker build -t img-grafana grafana/ &> /dev/null
printf "image built!\n\n"
printf "building influxdb image...\n"
docker build -t influx influxDB/ &> /dev/null
printf "image built!\n\n"
printf "building telegraf image...\n"
docker build -t img-telegraf telegraf/ &> /dev/null
printf "image built!\n\n"
printf "building mariadb image...\n"
docker build -t mysql-ctn MariaDB/ &> /dev/null
printf "image built!\n\n"
printf "building ftps image...\n"
docker build -t img-ftps ftps/ &> /dev/null
printf "image built!\n\n"
printf "building wordpress image...\n"
docker build -t wp-ctn2 wordpress/ &> /dev/null
printf "image built!\n\n"
printf "building phpmyadmin image\n"
docker build -t pma phpmyadmin/ &> /dev/null
printf "image built!\n\n"

sleep 5

printf "========>Deploying images into cluster<===========\n\n"
kubectl create -f ftps/ftps-deployment.yaml &> /dev/null
kubectl create -f grafana/grafana-deployment.yaml &> /dev/null
kubectl create -f influxDB/influxdb-deployment.yaml &> /dev/null
kubectl create -f MariaDB/mariadb-deployment.yaml &> /dev/null
kubectl create -f nginx/nginx-deployment.yaml &> /dev/null
kubectl create -f phpmyadmin/phpmyadmin-deployment.yaml &> /dev/null
kubectl create -f telegraf/telegraf-deployment.yaml &> /dev/null
kubectl create -f wordpress/wordpress-deployment.yaml &> /dev/null

printf "Launching Dashboard! *pewwwwiouuuu* (launching sound)\n"
minikube dashboard

printf "\ndone!\n"