#!/bin/bash

# principal
PRINCIPAL=${PRINCIPAL:-root}

# set secret
if [ -n "$SECRET" ]; then
    touch /tmp/credential
    chmod 600 /tmp/credential
    printf '%s %s' "$PRINCIPAL" "$SECRET" > /tmp/credential
    export MESOS_CREDENTIAL=/tmp/credential
fi

# use EC2 IPv4 Address
if [ -n "$EC2_INSTANCE" ]; then
    export MESOS_ADVERTISE_IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
fi

# start service
exec "$@"