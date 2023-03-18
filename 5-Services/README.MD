## Services

### Create Service
```
kubectl create -f service.yaml

kubectl get svc 

kubectl describe svc kubia
```

### Access service
```
k exec -it kubia-czmh5 -- curl http://kubia:80

k exec -it kubia-czmh5 -- curl http://kubia.default.svc.cluster.local

k exec -it kubia-czmh5 -- env

```

### Nodeport Access
```
k apply -f nodeport.yaml

k describe svc kubia-nodeport

curl http://localhost:30950
```
### LoadBalancer Access
```
gcloud container clusters create kubia --num-nodes 2 --machine-type e2-small

# Display Loadbalancer on Cloud console
k apply -f loadbalancer.yaml

k describe svc kubia-loadbalancer

curl external-ip

k delete svc kubia-loadbalancer

gcloud container clusters delete kubia

```

### Ingress Controller

```
k create ns ingress-nginx

kcd ingress-nginx

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

kcd default

k apply -f ingress.yaml

k describe ingress ingress-kubia

# host kaydı eklenir.

curl -v kubia.example.com

k get endpoints

```

### ReadinessProbe Tanımlama

```
k apply -f rs-readiness.yaml

k decsribe pod kubia-readiness-ddj5g
```
### Headless Servis 

```
k apply -f headless-service.yaml

k describe svc kubia-headless

k run dnsutils --image=tutum/dnsutils --command -- sleep infinity

kubectl exec dnsutils -- nslookup kubia-headless

k delete rs kubia-readiness

k delete svc kubia-headless
```