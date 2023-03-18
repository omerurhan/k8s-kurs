## Replications and Other Controllers

### Liveness Probe inspect

```
k create -f pod.yaml

k describe pod kubia-liveness

k explain pod.spec.containers.livenessProbe
```

### ReplicationController practices.

```
kubectl apply -f rc.yaml

kubectl delete pod kubia- 

kubectl get rc

kubectl describe rc kubia

kubectl label pod kubia- type=special --overwrite

# replace template
kubectl edit rc kubia 


kubectl scale rc kubia --replicas=5

kubectl delete rc kubia --cascade=false
```
### ReplicaSet practices
```
kubectl apply -f rs.yaml

kubectl get rs

kubectl describe rs

kubectl delete rs kubia
```
### DaemonSet practices

```
k apply -f ds.yaml  

k describe daemonset ssd-monitor

k label node test-worker disk=ssd
k label node test-worker2 disk=ssd

k describe ds ssd-monitor

k label node test-worker2 disk=hdd --overwrite
```

### Job

```
k apply -f job.yaml

k get job

k describe job 

k delete job batch-job
```

### CronJob

```
k apply -f cronjob.yaml


k get cronjob 

k describe cronjob
```