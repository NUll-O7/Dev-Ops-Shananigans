# Kubernetes Assignment Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add concept-named, self-contained Kubernetes assignment exercises.

**Architecture:** Reuse the corresponding manifests and documentation from
`/home/dhruv/Projects/Dev/DevOps/devops-heros`, grouped into four concept
directories. Add one index README per area and link the areas from the root
README.

**Tech Stack:** Kubernetes YAML, Markdown, Bash, `kubectl`, Minikube.

**Spec:** `docs/superpowers/specs/2026-09-24-kubernetes-assignment-design.md`

## Global Constraints

- Use names based on concepts, not `sessionN`.
- Keep each concept self-contained.
- Do not commit generated certificates, screenshots, or real credentials.

## Review Focus

- References must not point back to `sessionN` paths.
- Shell scripts must remain executable and syntactically valid.
- YAML must parse as Kubernetes manifests.
- Existing exercises must remain unchanged.
- Root documentation must expose the new areas.

### Task 1: Fundamentals

Create `Kubernetes Fundamentals/` with cluster verification and architecture
documentation adapted from the assignment and reference repository.

### Task 2: Core Objects

Create `Kubernetes Core Objects/` with pod, lifecycle, ReplicaSet, StatefulSet,
DaemonSet, Deployment, rollout strategy, and troubleshooting subdirectories.

### Task 3: Services

Create `Kubernetes Services/` with one directory per service type plus DNS,
selector troubleshooting, and workload comparison notes.

### Task 4: Ingress and configuration

Create `Kubernetes Ingress/` with ConfigMap, Secret, Ingress/TLS, and full demo
subdirectories, omitting generated secrets and certificates.

### Task 5: Documentation and verification

Link the four areas from the root README, check the tree, parse YAML when a
parser is available, run `bash -n` on copied scripts, and confirm the existing
working tree changes were not overwritten.
