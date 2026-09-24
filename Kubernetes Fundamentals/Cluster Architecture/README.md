# Cluster Architecture

Document the two major parts of a Kubernetes cluster:

- The control plane contains the API server, scheduler, controller manager,
  and `etcd`, which stores the declarative cluster state.
- Worker nodes contain the kubelet, container runtime, and networking proxy;
  they run the pods assigned by the scheduler.

The API server is the boundary between users/controllers and cluster state:
controllers reconcile objects stored in `etcd`, while kubelets turn the
resulting pod specifications into running containers.
