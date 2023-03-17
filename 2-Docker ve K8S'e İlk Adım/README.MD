## Docker ve Kubernetes'e İlk Adım
---

### Alias tanımlanması.
```
alias k="kubectl"
alias kcd='kubectl config set-context $(kubectl config current-context) --namespace '
```

### Konteyner Build, Run, Inspect, Stop, Remove

```
docker build -t kubia
docker run -d -p 8080:8080 kubia
docker exec -it kubia bash

docker stop kubia
docker rm kubia

```

### Install kubectl

```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl"

chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
sudo chown root: /usr/local/bin/kubectl

kubectl version --client
```

### Install & Start Minikube.

```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
sudo install minikube-darwin-amd64 /usr/local/bin/minikube
minikube start --driver=docker

minikube dashboards

minikube delete
```
### Kind Cluster
```
kind create cluster --config cluster.yaml --name test
```
### GCP kubernetes installation

```
curl -LO https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-422.0.0-darwin-x86_64.tar.gz
tar -zxvf google-cloud-cli-422.0.0-darwin-x86_64.tar.gz
./google-cloud-sdk/install.sh
source ~/.zshrc
gcloud components install gke-gcloud-auth-plugin



gcloud init
gcloud container clusters create kubia --num-nodes 2 --machine-type e2-small
gcloud compute ssh <node-name>

# dashboard access url
kubectl cluster-info | grep dashboard 

gcloud container clusters delete kubia

```


### Running first application and access

```
kubectl run kubia --image=omerurhan/kubia --port=8080

kubectl get pods

kubectl scale rc kubia --replicas=3 

kubecl expose pod kubia --port=8080 --type=LoadBalancer

```