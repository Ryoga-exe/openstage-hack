#!/bin/sh

: "${DEVICE_HOST:?DEVICE_HOST is not set}"

DEVICE_USER="${DEVICE_USER:-admin}"
DEVICE_REMOTE_DIR="${DEVICE_REMOTE_DIR:-/home/admin}"

ssh_device() {
    ssh \
        -o PubkeyAcceptedKeyTypes=+ssh-rsa \
        -o HostKeyAlgorithms=+ssh-rsa \
        -o KexAlgorithms=+diffie-hellman-group14-sha1 \
        "${DEVICE_USER}@${DEVICE_HOST}" \
        "$@"
}
