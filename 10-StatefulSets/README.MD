## StatefulSETS

### Create StatefulSet application.
```
docker build -t omerurhan/kubia-pet .
docker push omerurhan/kubia-pet

k apply -f service.yaml
k describe svc kubia-headless
k apply -f statefulset.yaml
k get sts,pvc,pv
k get pods
k describe sts kubia

# access pods directly
kubectl port-forward kubia-0 8080:8080
curl localhost:8080
curl -X POST -d "Hey there! This greeting was submitted to kubia-0." localhost:8080

kubectl port-forward kubia-1 8081:8080
curl localhost:8081

k delete pod kubia-0
curl localhost:8080
```

### Peer Discovery
```
kubectl run -it srvlookup --image=tutum/dnsutils --rm --restart=Never -- dig SRV kubia-headless.default.svc.cluster.local

docker build -t omerurhan/kubia-pet-peers-image .
docker push omerurhan/kubia-pet-peers-image

kubectl edit statefulset kubia
watch kubectl get sts,pods

curl -X POST -d "The sun is shining" localhost:30950
curl -X POST -d "The weather is sweet" localhost:30950
curl -X POST -d "The weather is bad" localhost:30950

k scale sts kubia --replicas=3
```

### Clear environment
```
k delete all --all
```