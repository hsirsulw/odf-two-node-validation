#!/usr/bin/env bash
set -euo pipefail

echo "Applying Phase 1 manifests"
oc apply -f manifests/01-rwx-nginx/

echo "Applying Phase 2 manifests"
oc apply -f manifests/02-rwx-busybox/

echo "Applying Phase 3 manifests"
oc apply -f manifests/03-timescaledb/
