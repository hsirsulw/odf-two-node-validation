# Failover Checklist

Use this checklist while the database workload is running.

1. Confirm the workload is healthy and writing data.
2. Power off or isolate one node.
3. Observe whether the application stays available.
4. Verify the PVC remains attached and data access continues.
5. Restore the node and watch Ceph/DRBD recovery.
6. Record any symptoms, logs, or recovery times.
