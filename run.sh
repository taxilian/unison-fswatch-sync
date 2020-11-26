#!/bin/bash

export DATA_SHARED=${DATA_SHARED:-/data/shared}
export DATA_LOCAL=${DATA_LOCAL:-/data/local}

# export UNISON_FLAGS=${UNISON_FLAGS:-"-retry 3 -auto -batch -repeat watch -numericids"}

export CLOSE=0

cleanup () {
    export CLOSE=1
    pkill -SIGTERM unison*
    exit 0
}

trap cleanup SIGINT SIGTERM

while [ 1 ]; do
    echo "Starting fs watch for changes:"
    unison "${DATA_SHARED}/" "${DATA_LOCAL}/" -prefer "${DATA_SHARED}/" "$@"
    echo "unison died; exit code $?. looping unless killed..."
done
