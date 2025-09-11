# Local Network Setup Guide

## Binary = Genesis

To run:

```
# Bring up services (localstack + postgres).
mpctl-dkr-services-up

# Initialise dB.
mpctl-job-pgres-init-from-plain-text-iris-file

# Bring up network in genesis mode.
mpctl-local-net-setup
mpctl-local-net-start-genesis

# View node logs.
mpctl-local-node-view-logs node=0 filter="HNSW-GENESIS"
mpctl-local-node-view-logs node=1 filter="HNSW-GENESIS"
mpctl-local-node-view-logs node=2 filter="HNSW-GENESIS"
```

To re-run:

```
# Reset network.
mpctl-local-net-reset

# Truncate CPU postgreSQL tables.
mpctl-job-pgres-truncate-cpu-tables

# Bring up network in genesis mode.
mpctl-local-net-start-genesis

# View node logs.
mpctl-local-node-view-logs node=0 filter="HNSW-GENESIS"
mpctl-local-node-view-logs node=1 filter="HNSW-GENESIS"
mpctl-local-node-view-logs node=2 filter="HNSW-GENESIS"
```
