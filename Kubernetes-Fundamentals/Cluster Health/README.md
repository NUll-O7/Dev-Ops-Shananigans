# Cluster Health

Run the baseline checks before any workload lab:

```bash
minikube start
kubectl version --output=yaml
kubectl cluster-info
kubectl get nodes -o wide
```

Expected result: the control plane and CoreDNS are reachable and every node
reports `Ready`.

Clean up when finished with `minikube stop`.
