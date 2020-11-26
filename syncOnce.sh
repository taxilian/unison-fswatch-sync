#!/bin/bash

export DATA_SHARED=${DATA_SHARED:-/data/shared}
export DATA_LOCAL=${DATA_LOCAL:-/data/local}

# if [ "$@" == "" ]; then
#     export UNISON_FLAGS="-retry watch 10 -maxerrors 10 -auto -batch -numericids"
# fi

echo "Using these unison flags: ${UNISON_FLAGS}"

export CLOSE=0

function doSync {
    echo "Running ${1}"
    set -x
    unison "${DATA_SHARED}/" "${DATA_LOCAL}/" -prefer "${DATA_SHARED}/" "$@"
    set +x
}
export -f doSync

echo "Performing one-time sync between ${DATA_SHARED} (shared/common) and ${DATA_LOCAL} (local)"
doSync "$@"
if [ $? -ne 0 ]; then
    echo "Failed to sync!"
    exit 1;
fi
