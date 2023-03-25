## Pod Kaynak Yönetimi

### Request & Limits example
```
k apply -f pod-requests.yaml  
k describe pod requests-pod
k describe node test-worker

k apply -f pod-requests-unallocable.yaml
k get po requests-pod-unallocable
k describe pod requests-pod-unallocable


k apply -f pod-limits.yaml
k describe pod limits-pod
```

### LimitRange & ResourceQuota

```
k apply -f limits.yaml
k describe limitrange example
k apply -f pod-limits-to-high.yaml
k apply -f ../13-Node\ ve\ Network\ Güvenliği/pod-default.yaml
k describe po pod-default

k apply -f quota-cpu-memory.yaml
k get resourcequota
k describe resourcequota cpu-and-mem
kubectl describe quota    

k delete limitrange example
k apply -f ../13-Node\ ve\ Network\ Güvenliği/pod-default.yaml

k apply -f quota-object-count.yaml
k get quota

k apply -f deploy.yaml
k get rs 
k desciribe rs
```

### Metrics-Server Installation
```
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
#add --kubelet-insecure-tls arg for CA error.
k edit deploy metrics-server

k top nodes 
k top pods
```

### Clear environment
```
k delete all --all
k delete quota --all 
k delete limitrange --all
```
### TODO

kubeprom-stack example