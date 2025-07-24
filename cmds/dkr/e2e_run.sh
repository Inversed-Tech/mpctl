#!/usr/bin/env bash

function _help() {
    echo "
    COMMAND
    ----------------------------------------------------------------
    mpctl-dkr-run-e2e-tests

    DESCRIPTION
    ----------------------------------------------------------------
    Runs full end to end HNSW tests.
    "
}

function _main()
{
    pushd "$(get_path_to_monorepo)" || exit
    docker compose -f "${MPCTL_DKR_COMPOSE_HNSW_E2E}" \
        exec "${MPCTL_DKR_CONTAINER_HNSW_E2E}" "/src/iris-mpc/scripts/run-tests-hnsw-e2e.sh"
    popd || exit
}

# ----------------------------------------------------------------
# ENTRY POINT
# ----------------------------------------------------------------

source "${MPCTL}"/utils/main.sh

unset _HELP

for ARGUMENT in "$@"
do
    KEY=$(echo "$ARGUMENT" | cut -f1 -d=)
    case "$KEY" in
        help) _HELP="show" ;;
        *)
    esac
done

if [ "${_HELP:-""}" = "show" ]; then
    _help
else
    _main
fi
