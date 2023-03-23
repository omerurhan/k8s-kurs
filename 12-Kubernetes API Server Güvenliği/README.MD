## Kubernetes API Server Güvenliği 

### ServiceAccount 
```
kubectl get sa
kubectl create serviceaccount foo
kubectl describe sa foo
k apply -f secret-token.yaml

k apply -f pod.yaml
k exec -it curl-custom-sa -c main -- cat /var/run/secrets/kubernetes.io/serviceaccount/token

export CURL_CA_BUNDLE=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
export TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
curl -H "Authorization: Bearer $TOKEN" https://kubernetes/api/v1/namespaces/default/services
```

### RBAC Examples

```
docker exec -it <control-plane-container> bash
more /etc/kubernetes/manifests/kube-apiserver.yaml


k create role service-reader --verb=get,list,watch --resource=service
k describe role service-reader
k get role service-reader -o yaml

k create rolebinding service-reader --role=service-reader --serviceaccount=default:foo
k get rolebinding service-reader -o yaml
k auth can-i get services -n default --as system:serviceaccount:default:foo

#Clusterrole
kubectl create clusterrole pv-reader --verb=get,list --resource=persistentvolumes
k create rolebinding pv-reader --clusterrole=pv-reader --serviceaccount=default:foo

export CURL_CA_BUNDLE=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
export TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
curl -H "Authorization: Bearer $TOKEN" https://kubernetes/api/v1/persistentvolumes

# System roles
kubectl get clusterrolebindings
kubectl get clusterroles
k describe clusterrole cluster-admin   
```