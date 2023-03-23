## Kubernetes Internals

### Inspect Control Plane and events
```
kubectl get componentstatus

kubectl get po -o custom-columns=POD:metadata.name,NODE:spec.nodeName --sort-by spec.nodeName -n kube-system

k apply -f pod-etcdclient.yaml
etcdctl get /registry --prefix --keys-only
etcdctl get /registry/pods --prefix --keys-only


k get events -A --sort-by='.lastTimestamp'

```