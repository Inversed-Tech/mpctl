# Dockerised Network Setup Guide

## Binary = Genesis

To run:

```
# Build node docker images (main, genesis, e2e).
mpctl-dkr-build-images

# Bring up services (localstack + postgres).
mpctl-dkr-services-up

# Initialise dB.
mpctl-dkr-init-db-for-genesis

# Bring up network in genesis mode.
mpctl-dkr-net-up-genesis

# View node logs.
mpctl-dkr-node-view-logs-genesis node=0
mpctl-dkr-node-view-logs-genesis node=1
mpctl-dkr-node-view-logs-genesis node=2
```

To re-run:

```
# Tear down MPC genesis nodes.
mpctl-dkr-net-down-genesis

# Truncate CPU tables.
mpctl-job-pgres-truncate-cpu-tables

# Rebuild MPC node docker images.
mpctl-dkr-build-images

# Spin up MPC genesis nodes.
mpctl-dkr-net-up-genesis

# View MPC node logs.
mpctl-dkr-node-view-logs-genesis node=0
mpctl-dkr-node-view-logs-genesis node=1
mpctl-dkr-node-view-logs-genesis node=2
```
