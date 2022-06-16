Welcome to my ft_services [multi-service cluster] repository 👋

⭐️ This project aims to introduce us to Kubernetes in order to virtualize a network and discover what a production environment is. For this, the project consists in setting up a cluster gathering several service containers. Each service runs in a dedicated container built under Linux Alpine.

### ✅ [Features] ⤵️

- A Kubernetes web dashboard
- A Load Balancer with a single ip which manages the external access of the services. It is the only entry point to the cluster
- A WordPress website listening on port 5050, which works with a MySQL database. Both services run in separate containers. Wordpress has its own nginx server.
- phpMyAdmin, listening on port 5000 and linked with the MySQL database. it has its own nginx server.
- A container with an nginx server listening on ports 80 and 443. Port 80 is in http and is a systematic redirection of type 301 to 443, which is in https.
- A FTPS server listening on port 21.
- A Grafana platform, listening on port 3000, linked with an InfluxDB database. Grafana is monitoring all the containers.

### 💡 Usage
- ./setup.sh
- If you want to restart only some services : source fct.zsh then kre service_name

### 🖇 Reference
- Kubernetes - Understand Kubernetes, what .yaml is, services, pods, etc.
- Minikube - "Tool to facilitate local execution of Kubernetes"
- MetalLB - To install the Loadbalancer
- Alpine Linux - To find the packages corresponding to Alpine
### Version
Version of Alpine: 3.12.3
