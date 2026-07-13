# Phase 1 - RWX Validation

This phase validates CephFS RWX access by deploying two UBI-minimal test deployments, one on each node, and mounting the same PVC.

## What it validates

- CephFS StorageClass
- RWX PVC behavior
- Shared read/write access between nodes

## Apply

```bash
oc apply -f manifests/01-rwx-nginx/tester-master1.yaml
oc apply -f manifests/01-rwx-nginx/tester-master2.yaml
```

## Verify

```bash
oc get pvc -n odf-demo
oc get pods -n odf-demo -o wide
```

Then run:

```bash
oc get pods -n odf-demo -o wide
```

Pick one pod and run:

```bash
oc exec -it deploy/tester-master1 -n odf-demo -- sh
```

Inside the shell:

```sh
echo "Hello from one replica" > /shared/test.txt
```

Now open the second pod:

```bash
oc exec -it deploy/tester-master2 -n odf-demo -- sh
```

And verify:

```sh
cat /shared/test.txt
```

If you see:

```text
Hello from master1
```

Phase 1 is complete.
