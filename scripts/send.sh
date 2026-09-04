#!/bin/sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
. "$SCRIPT_DIR/_common.sh"

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file>" >&2
    exit 1
fi

src="$1"
name=$(basename -- "$src")
dst="${DEVICE_REMOTE_DIR}/${name}"

if [ ! -f "$src" ]; then
    echo "File not found: $src" >&2
    exit 1
fi

echo "$src -> ${DEVICE_USER}@${DEVICE_HOST}:$dst"

ssh_device "cat > '$dst'" < "$src"
