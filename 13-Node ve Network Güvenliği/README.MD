## Node ve Network Güvenliği

### Linux Host namespace examples
```
k apply -f pod-hostnetwork.yaml
kubectl exec pod-with-host-network -- ifconfig

k apply -f pod-hostport.yaml
k get pod kubia-hostport -o wide
docker exec -it test-worker2 curl localhost:9000

k apply -f pod-pid-ipc.yaml
k get pod pod-with-host-pid-and-ipc -o wide
k exec -it pod-with-host-pid-and-ipc -- ps aux
```

### SecurityContext examples
```
k apply -f pod-as-user.yaml
k exec -it pod-as-user-guest -- id

k apply -f pod-run-as-non-root.yaml  
k get pod pod-run-as-non-root
k describe pod pod-run-as-non-root

k apply -f pod-priviledged.yaml    
k exec -it pod-privileged -- ls -l /dev  

k apply -f pod-default.yaml
kubectl exec -it pod-default -- date +%T -s "12:00:00" 
k apply -f pod-settime-capability.yaml 
k exec -it pod-add-settime-capability -- date +%T -s "12:00:00"

k apply -f pod-readonly-fs.yaml
kubectl exec -it pod-with-readonly-filesystem -- touch /new-file
kubectl exec -it pod-with-readonly-filesystem -- touch /volume/newfile
kubectl exec -it pod-with-readonly-filesystem -- ls -la /volume
```

### TODO

CNI installation and NetworkPolicy Examples