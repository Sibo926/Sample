In kube.yaml I have definations for statefulset, pv and pvc objects. used static provisioning we can use dynamic too.

I have used nfs as volume mount which i am famillier with.

# To create objects in k8s cluster use below command 

```
kubectl apply -f kube.yaml
```