SHELL := /bin/bash

.PHONY: help rwx busybox db sensor failover cleanup

help:
	@echo "Available targets:"
	@echo "  make rwx        - Apply RWX nginx validation manifests"
	@echo "  make busybox    - Apply RWX busybox validation manifests"
	@echo "  make db         - Apply TimescaleDB validation manifests"
	@echo "  make sensor     - Apply sensor generator manifests"
	@echo "  make failover   - Show failover checklist"
	@echo "  make cleanup    - Remove validation manifests"

rwx:
	oc apply -f manifests/01-rwx-nginx/

busybox:
	oc apply -f manifests/02-rwx-busybox/

db:
	oc apply -f manifests/03-timescaledb/

sensor:
	oc apply -f manifests/04-sensor-generator/

failover:
	@echo "Review manifests/05-failover/failover-checklist.md"

cleanup:
	oc delete -f manifests/01-rwx-nginx/ --ignore-not-found=true
	oc delete -f manifests/02-rwx-busybox/ --ignore-not-found=true
	oc delete -f manifests/03-timescaledb/ --ignore-not-found=true
	oc delete -f manifests/04-sensor-generator/ --ignore-not-found=true
