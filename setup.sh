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

if [ "$?" != 0 ]
then
    printf "minikube could not start, please relaunch\n"
    exit
fi

# get minikube (true) ip
# CLUSTER_IP="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"

# deploy metallb
# add "> /dev/null" to remove info in stdout 
# attention a l'ordre!!
printf "\n\n========>Deploying Metallb<===========\n\n\n"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml 2> /dev/null
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml 2> /dev/null
kubectl apply -f srcs/metallb-config.yaml 2> /dev/null
# config secret for metallb
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" 2> /dev/null

# mettre les images en local et a jour :
printf "\n\n========>Linking docker's images to minikube<===========\n\n"
eval $(minikube -p minikube docker-env)
if [ "$?" != 0 ]
then
    printf "docker-env crashed, please relaunch\n"
    exit
fi
printf "done!\n\n"

# installer filezilla pour ftps
printf "=====>Installing Filezilla to check ftps server (Or maybe is it a virus mouahah)<====\n"
sudo apt install filezilla

printf "\n\n========>Building docker's images (see you in two years)<===========\n\n"
printf "building nginx image...\n"
docker build -t nginx srcs/nginx/ 2> /dev/null
if [ "$?" != 0 ]
then
    printf "error in building image, please relaunch\n"
    exit
fi
printf "image built!\n\n"

printf "building grafana image...\n"
docker build -t img-grafana srcs/grafana/ 2> /dev/null
if [ "$?" != 0 ]
then
    printf "error in building image, please relaunch\n"
    exit
fi
printf "image built!\n\n"

printf "building influxdb image...\n"
docker build -t influx srcs/influxDB/ 2> /dev/null
if [ "$?" != 0 ]
then
    printf "error in building image, please relaunch\n"
    exit
fi
printf "image built!\n\n"

printf "building telegraf image...\n"
docker build -t img-telegraf srcs/telegraf/ 2> /dev/null
if [ "$?" != 0 ]
then
    printf "error in building image, please relaunch\n"
    exit
fi
printf "image built!\n\n"

printf "building mariadb image...\n"
docker build -t mysql-ctn srcs/MariaDB/ 2> /dev/null
if [ "$?" != 0 ]
then
    printf "error in building image, please relaunch\n"
    exit
fi
printf "image built!\n\n"

printf "building ftps image...\n"
docker build -t img-ftps srcs/ftps/ 2> /dev/null
if [ "$?" != 0 ]
then
    printf "error in building image, please relaunch\n"
    exit
fi
printf "image built!\n\n"

printf "building wordpress image...\n"
docker build -t wp-ctn2 srcs/wordpress/ 2> /dev/null
if [ "$?" != 0 ]
then
    printf "error in building image, please relaunch\n"
    exit
fi
printf "image built!\n\n"

printf "building phpmyadmin image\n"
docker build -t pma srcs/phpmyadmin/ 2> /dev/null
if [ "$?" != 0 ]
then
    printf "error in building image, please relaunch\n"
    exit
fi
printf "image built!\n\n"

sleep 3

printf "========>Deploying images into cluster<===========\n\n"
kubectl create -f srcs/ftps/ftps-deployment.yaml 2> /dev/null
kubectl create -f srcs/influxDB/influxdb-deployment.yaml 2> /dev/null
kubectl create -f srcs/telegraf/telegraf-deployment.yaml 2> /dev/null
kubectl create -f srcs/grafana/grafana-deployment.yaml 2> /dev/null
kubectl create -f srcs/MariaDB/mariadb-deployment.yaml 2> /dev/null
kubectl create -f srcs/nginx/nginx-deployment.yaml 2> /dev/null
kubectl create -f srcs/phpmyadmin/phpmyadmin-deployment.yaml 2> /dev/null
kubectl create -f srcs/wordpress/wordpress-deployment.yaml 2> /dev/null

sleep 3

printf "=====>Launching Dashboard! *pewwwwiouuuu* (launching sound)<========\n"
minikube dashboard

printf "\ndone!\n"