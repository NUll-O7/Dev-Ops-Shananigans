# Kubernetes Assignment Design

## Goal

Turn `DevOps Assignment Season 2.md` into runnable, self-contained learning
areas named for their concepts rather than lecture/session numbers.

## Structure

- `Kubernetes Fundamentals/`: cluster setup and architecture notes.
- `Kubernetes Core Objects/`: pods, lifecycle, controllers, deployments,
  rollout strategies, and troubleshooting.
- `Kubernetes Services/`: service types, DNS, selectors, and workload
  comparisons.
- `Kubernetes Ingress/`: ConfigMaps, Secrets, Ingress, TLS, and the full
  multi-tier demo.

Each hands-on concept gets its own subdirectory with its manifest(s) and a
README containing the assignment commands, expected checks, and cleanup.
Existing material is reused from `devops-heros`; unrelated reference work and
screenshots are not copied.

## Constraints

- Do not rename the existing exercises.
- Do not add new dependencies or application code unless the assignment
  requires it.
- Keep secrets and generated TLS material out of the repository.
- Validate YAML syntax and shell syntax locally where tools are available.
