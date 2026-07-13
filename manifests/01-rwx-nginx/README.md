# Phase 1 - RWX NGINX Validation

This phase validates CephFS RWX access by deploying two nginx pods on different nodes and mounting the same PVC.

## What it validates

- CephFS StorageClass
- RWX PVC behavior
- Shared read/write access between nodes

## Apply

```bash
oc apply -f manifests/01-rwx-nginx/
```

## Verify

```bash
oc get pvc -n odf-demo
oc get pods -n odf-demo -o wide
oc rsh -n odf-demo <pod-name> sh -c 'echo "Hello" > /shared/index.html'
```
