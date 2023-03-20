## Pod Metadatasına Erişim

### Downward API
```
k apply -f pod-env-downward.yaml
kubectl exec downward-env -- env

k apply -f pod-volume-downward.yaml
kubectl exec downward-volume --  ls -lL /etc/downward
kubectl exec downward-volume --  cat /etc/downward/podName
```

### Kubernetes API endpoints
```
kubectl cluster-info
kubectl proxy

curl http://127.0.0.1:8001
curl -L http://127.0.0.1:8001/api/v1
curl -L http://127.0.0.1:8001/api/v1/namespaces/default
curl -L http://127.0.0.1:8001/api/v1/namespaces/default/pods/downward-env


k apply -f pod-apiclient.yaml
k exec -it curl -- sh

env | grep KUBERNETES
curl https://kubernetes
ls -l /var/run/secrets/kubernetes.io/serviceaccount/
curl --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt https://kubernetes
export CURL_CA_BUNDLE=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt

cat /var/run/secrets/kubernetes.io/serviceaccount/token
TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
curl -H "Authorization: Bearer $TOKEN" https://kubernetes
```

### Clear Environment
```
k delete pods --all
```