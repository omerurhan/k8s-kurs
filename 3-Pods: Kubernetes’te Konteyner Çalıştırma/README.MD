## PODS

### Explain details in resource definition
```
kubectl explain pods
```
### Create pod 

```
kubectl run nginx --image nginx:latest --dry-run=client -o yaml > pod.yaml

kubectl apply -f pod.yaml

k get pod nginx -o json

```

### Display container logs

```
kubectl logs nginx

kubectl logs nginx -c nginx
```

### Access container port

```
kubectl port-forward nginx 8080:80

curl localhost:8080
```

### Labels

```
kubectl get po --show-labels

kubectl label po nginx env=debug --overwrite

kubectl get po -l env=debug

kubectl get po -l env=debug,run=nginx

kubectl label node minikube env=test
```

### Annotation

```
kubectl annotate pod nginx mycompany.com/someannotation="foo bar"

kubectl describe pod nginx
```

### Namespace 

```
kubectl get ns
kubectl get po --namespace kube-system

kubectl create ns test
```

### Deleting Pods

```
kubectl delete po kubia

kubectl delete po -l env=debug

kubectl delete po --all

kubect delete ns custom-namespace

```