#!/usr/bin/env bash
set -euo pipefail

echo "Deleting validation resources"
oc delete -f manifests/01-rwx-nginx/ --ignore-not-found=true
oc delete -f manifests/02-rwx-busybox/ --ignore-not-found=true
oc delete -f manifests/03-timescaledb/ --ignore-not-found=true
