## ConfigMaps & Secrets

### commands and arguments
```
docker build -t omerurhan/fortune:args .
docker push omerurhan/fortune:args

docker run -it omerurhan/fortune:args
docker run -it omerurhan/fortune:args 15

# K8S implementtion

k apply -f pods-arg.yaml

k logs fortune-args -c html-generator

kubectl port-forward fortune-args 8080:80

curl localhost:8080
```

### Environmnet Variable
```
docker build -f Dockerfile.env -t omerurhan/fortune:env .
docker push omerurhan/fortune:env

k apply -f pods-env.yaml

k logs fortune-env -c html-generator

kubectl port-forward fortune-env 8080:80

curl localhost:8080
```
### ConfigMaps

```
# Create ConfigMap with kubectl
kubectl create configmap fortune-config --from-literal=sleep-interval=25
kubectl describe cm fortune-config

# Create ConfigMap from file
k create configmap fortune-conf --from-file=fortune.conf


k apply -f pod-env-configmap.yaml  
k logs fortune-env-from-configmap -c html-generator
k exec -it fortune-env-from-configmap -c html-generator -- env |grep -i interval


k create configmap nginx-conf --from-file=nginx-config.conf
k logs fortune-volume-configmap -c html-generator
kubectl port-forward fortune-volume-configmap 8080:80

curl -I -H "Accept-Encoding: gzip"  localhost:8080
k exec -it fortune-volume-configmap -c web-server -- cat /etc/nginx/conf.d/nginx-config.conf
```

### Secrets
```
openssl genrsa -out https.key 2048
openssl req -new -x509 -key https.key -out https.cert -days 3650 -subj /CN=www.kubia-example.com

kubectl create secret generic fortune-https --from-file=https.key --from-file=https.cert
k get secret fortune-https -o yaml
k create configmap nginx-ssl-conf --from-file=nginx-ssl-config.conf
k apply -f pod-volume-secret.yaml
k logs fortune-volume-secret -c web-server
kubectl port-forward fortune-volume-secret 8443:443
curl -v -k https://localhost:8443
kubectl exec -it  fortune-volume-secret -c web-server -- ls -l /etc/nginx/certs
kubectl exec -it  fortune-volume-secret -c web-server -- df -h |grep -i certs


#imagepullsecret 
docker pull nginx:latest 
docker tag nginx:latest omerurhan/private:test
docker push omerurhan/private:test

kubectl create secret docker-registry private-secret --docker-username=omerurhan --docker-password=blabla
k describe secret private-secret
k apply -f pod-imagepullsecret.yaml

```