# Kubernetes Ingress

This area covers configuration injection, secret handling, and Layer 7
routing.

- `ConfigMap/`: non-sensitive runtime configuration.
- `Secrets/`: native Secret objects and Base64 behavior.
- `Ingress Routing/`: path, host, hybrid, and TLS routing manifests.
- `Full Stack Demo/`: ConfigMap + Secret + frontend/backend + Ingress.
- `Secret Troubleshooting/`: the trailing-newline encoding gotcha.

The full demo scripts require Minikube, the NGINX Ingress addon, `kubectl`,
and `sudo` only when adding local hostnames.
