## Advanced Scheduling

### Taints and Tolerations
```
k describe node test-control-plane 

kubectl taint node test-worker node-type=production:NoSchedule
k describe node test-worker |grep -i taint
kubectl create deploy test --image busybox --replicas 5 -- sleep 99999
kubectl get po -o wide

k edit deploy test 
tolerations:
- key: node-type
  operator: Equal
  value: production
  effect: NoSchedule

k taint node test-worker node-type=production:NoSchedule-
```
### Node Affinity example
```
kubectl label node test-worker availability-zone=zone1
kubectl label node test-worker share-type=dedicated
kubectl label node test-worker2 availability-zone=zone2
kubectl label node test-worker2 share-type=shared
kubectl get node -L availability-zone -L share-type

k apply -f deploy-preffered.yaml
k get pods -o wide
k scale deploy pref --replicas=10

k delete deploy pref
```

### Pod Affinity & Pod AntiAffinity

```
k create deploy backend --image busybox -- sleep 999999
k get pods --show-labels
k scale deploy frontend --replicas 10

k delete deploy backend
k create deploy backend --image busybox -- sleep 999999
k get pods -o wide

# Pod Anti-Affinity
k create deploy backend --image busybox -- sleep 999999
k apply -f deploy-frontend-pod-anti-affinity.yaml
k scale deploy frontend --replicas 6   
```

### Clear Environment
```
k delete all --all
```