## Volumes

### emptyDir example
```
docker build -t omerurhan/fortune  .

docker push omerurhan/fortune

k apply -f pod-empyydir.yaml 

k apply -f svc-emptydir.yaml

kubectl port-forward fortune 8080:80

curl localhost:8080
```

### hostPath 
```
k describe pod kube-apiserver-test-control-plane -n kube-system
```

### GCE Persistent Storage
```
gcloud container clusters create kubia --num-nodes 2 --machine-type e2-small
gcloud container clusters list 
gcloud compute disks create --size=10GiB --zone=europe-west1-c mongodb

k apply -f pod-gce.yaml
k describe pod mongodb 
k exec -it mongodb -- mongosh

use mystore
db.foo.insert({name:'omer'})
db.foo.find()
exit 

kubectl delete pod mongodb

k apply -f pod-gce.yaml
k exec -it mongodb -- mongosh
use mystore
db.foo.find()
exit

k delete pod mongodb
```

### GCE PersistentVolume & PersistentVolumeClaim
```
k apply -f pv.yaml

k get pv

k apply -f pvc.yaml 

k get pvc

k describe pvc mongodb-pvc

k apply -f pod-pvc.yaml

k delete pod mongodb

k delete pv 

k delete pvc
```

### StorageClass
```
k apply -f sc.yaml

k get sv

k describe sc fast 

k apply -f pvc-sc.yaml

k get pv,pvc

k delete pvc mongodb-pvc  

k get pv,pvc
```

### Clear Environment

```
gcloud compute disks delete mongodb

gcloud container clusters delete kubia

```