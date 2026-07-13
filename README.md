# ODF Two-Node Validation

This repository is a reusable validation suite for Red Hat OpenShift Data Foundation on a two-node with fencing (TNF) cluster.

## Purpose

The goal is to validate core ODF capabilities in a repeatable way:

- CephFS RWX validation
- RBD RWO validation
- Failover and recovery
- Snapshot and restore
- PVC expansion
- Performance benchmarking

## Repository Layout

```text
odf-two-node-validation/
├── README.md
├── LICENSE
├── .gitignore
├── Makefile
├── docs/
├── manifests/
├── scripts/
├── sensor-generator/
└── results/
```

## Getting Started

1. Review the architecture notes in docs/.
2. Apply the manifests in the desired phase directory.
3. Use the provided scripts to deploy or clean up the validation scenarios.

## Phases

- 01-rwx-nginx: Validate CephFS shared storage between two pods.
- 02-rwx-busybox: Validate RWX behavior with a simple shared file test.
- 03-timescaledb: Validate RBD-backed database workloads.
- 04-sensor-generator: Generate continuous writes into the database.
- 05-failover: Capture failover and recovery steps.
- 06-snapshots: Validate snapshot creation.
- 07-restore: Restore from a snapshot.
- 08-expand-pvc: Validate online PVC expansion.
- 09-fio: Run I/O benchmarking.
