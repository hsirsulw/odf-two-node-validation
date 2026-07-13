# Architecture Notes

This repository targets an OpenShift two-node with fencing environment using:

- OpenShift Data Foundation
- CephFS for RWX workloads
- RBD for RWO workloads
- A DRBD-backed floating monitor

## Validation Flow

1. Validate CephFS shared storage with two pods on different nodes.
2. Validate RBD-backed database storage with TimescaleDB.
3. Exercise failover and recovery while the workload is running.
4. Capture snapshot, restore, and PVC expansion behavior.
5. Run fio benchmark workloads.
