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
curl -v www.kubia-example.com
k get endpoints

```
### Ingress with TLS

```
openssl genrsa -out https.key 2048
openssl req -new -x509 -key https.key -out https.cert -days 3650 -subj /CN=www.kubia-example.com
k create secret tls tls-secret --cert=https.cert --key=https.key
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
```

### Clear environment
```
gcloud container clusters delete kubia
k delete all --all
```