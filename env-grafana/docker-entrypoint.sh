#!/bin/bash

# Fail hard and fast
set -eo pipefail

# 14 magic number. len of grafana-server. Because of CMD without quotes in Dockerfile, $1 will be 'bin/sh', $2 '-c' and $3 our command with args
if [ "$1" = 'grafana-server' ]; then
    /tmp/create-entities.sh &
    exec gosu stoic "$@"
fi

exec "$@"
