## Deployments

### Build & Push Images
```
docker build -f Dockerfile.v1 -t omerurhan/kubia:v1 .
docker build -f Dockerfile.v2 -t omerurhan/kubia:v2 .
docker build -f Dockerfile.v3 -t omerurhan/kubia:v3 . 
docker push omerurhan/kubia:v1
docker push omerurhan/kubia:v2
docker push omerurhan/kubia:v3
```

### Manual Rolling Update
```
k apply -f kubia-rcv1-and-service.yaml
k get rc,svc,pods
while true; do curl http://localhost:30950 ; sleep 1; done

k apply -f kubia-rcv2.yaml
k scale rc kubia-v1 --replicas=2
k scale rc kubia-v2 --replicas=2
k scale rc kubia-v1 --replicas=1
k scale rc kubia-v2 --replicas=3
k scale rc kubia-v1 --replicas=0
k delete rc kubia-v1
k delete rc kubia-v2
```
### RollingUpdate with deployment
```
k explain deployments.spec.strategy.type
k apply -f deployment.yaml
k get rs,pod,deploy
kubectl patch deployment kubia -p '{"spec": {"minReadySeconds": 10}}'

while true; do curl http://localhost:30950; done
kubectl set image deployment kubia kubia=omerurhan/kubia:v2 --record
kubectl rollout status deployment kubia
k get po,rs
watch kubectl get po,rs 

kubectl set image deployment kubia kubia=omerurhan/kubia:v3
k rollout history deploy kubia 
k rollout status  deploy kubia
watch kubectl get po,rs

kubectl rollout undo deployment kubia
kubectl rollout undo deployment kubia --to-revision=1
k get po,rs
k delete deploy kubia
```

### RollingUpdate with readniness probe
```
k apply -f deployment-readiness.yaml
while true; do curl http://localhost:30950; done
kubectl set image deployment kubia kubia=omerurhan/kubia:v3
watch kubectl get po,rs
k rollout status  deploy kubia
k rollout undo deploy kubia
```