## Autoscaling

### HPA Example
```
k apply -f deployment.yaml
kubectl autoscale deployment kubia --min=1 --max=5 --cpu-percent=30
k get hpa kubia  
k describe hpa kubia

kubectl expose deployment kubia --port=80 --target-port=8080
watch -n 1 kubectl get hpa,deployment
kubectl run -it --rm --restart=Never loadgenerator --image=busybox -- sh -c "while true; do wget -O - -q http://kubia.default; done"
```