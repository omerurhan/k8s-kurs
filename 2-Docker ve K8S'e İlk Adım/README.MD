## Docker ve Kubernetes'e İlk Adım
---

### Konteyner Build, Run, Inspect, Stop, Remove

```
docker build -t kubia
docker run -d -p 8080:8080 kubia
docker exec -it kubia bash

docker stop kubia
docker rm kubia

```
### Kind Cluster
```
kind create cluster --config cluster.yaml --name test
```
### GCP kubernetes installation

```
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