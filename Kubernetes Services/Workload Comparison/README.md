# Workload Comparison

| Workload | Identity | Best fit |
|---|---|---|
| Deployment | Replaceable pod identities | Stateless applications |
| StatefulSet | Stable ordinal identity and storage | Stateful workloads |
| DaemonSet | One pod per eligible node | Node-level agents |

Use the manifests in the neighboring service and core-object labs to compare
pod replacement, naming, and placement behavior.
