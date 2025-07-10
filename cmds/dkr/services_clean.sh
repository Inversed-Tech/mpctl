#!/usr/bin/env bash

function _help() {
    echo "
    COMMAND
    ----------------------------------------------------------------
    mpctl-dkr-services-clean

    DESCRIPTION
    ----------------------------------------------------------------
    Cleans dockerised services, i.e. localstack & PostgreSQL.
    "
}

function _main()
{
    source "${MPCTL}"/cmds/dkr/services_down.sh
    source "${MPCTL}"/cmds/dkr/services_up.sh
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
