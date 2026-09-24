# Kubernetes Core Objects

Each directory is an independent lab for a Kubernetes workload concept.

- `Pods/`: standalone Nginx and short-lived batch pods.
- `Pod Lifecycle/`: pending, completed, failed, probes, init containers,
  sidecars, and graceful termination.
- `Workload Objects/`: Deployment, ReplicaSet, and StatefulSet manifests.
- `ReplicaSet/` and `DaemonSet/`: self-healing replicas and one-per-node
  agents.
- `Rolling Deployment/` and `Rolling Update/`: rollout and rollback drills.
- `Blue Green Deployment/`, `Canary Deployment/`, and `Recreate Deployment/`:
  release-strategy exercises.
- `Troubleshooting/`: broken-image and selector-mismatch diagnosis.

Run the commands from each local README and clean up its resources afterward.
