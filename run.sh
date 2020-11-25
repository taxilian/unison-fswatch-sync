#!/bin/bash

export DATA_SHARED=${DATA_SHARED:-/data/shared}
export DATA_LOCAL=${DATA_LOCAL:-/data/LOCAL}

function doSync {
    unison "${DATA_SHARED}/" "${DATA_LOCAL}/" -auto -batch
}

unison "${DATA_SHARED}/" "${DATA_LOCAL}/" -auto -batch
echo "Done" > /data/syncStatus

fswatch -o /data/ | xargs -n1 -I{} doSync