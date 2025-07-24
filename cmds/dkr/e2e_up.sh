#!/usr/bin/env bash

function _help() {
    echo "
    COMMAND
    ----------------------------------------------------------------
    mpctl-dkr-e2e-up

    DESCRIPTION
    ----------------------------------------------------------------
    Brings up HNSW end to end test docker container.
    "
}

function _main()
{
    pushd "$(get_path_to_monorepo)" || exit
    docker compose -f "${MPCTL_DKR_COMPOSE_HNSW_E2E}" \
        up --detach "${MPCTL_DKR_CONTAINER_HNSW_E2E}"
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
