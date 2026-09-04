#!/bin/sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
. "$SCRIPT_DIR/_common.sh"

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file>" >&2
    exit 1
fi

dst="$1"
name=$(basename -- "$dst")
src="${DEVICE_REMOTE_DIR}/${name}"

echo "${DEVICE_USER}@${DEVICE_HOST}:$src -> $dst"

ssh_device "cat '$src'" > "$dst"
