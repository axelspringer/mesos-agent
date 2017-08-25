#!/bin/bash

# principal
PRINCIPAL=${PRINCIPAL:-root}

# scret
if [ -n "$SECRET" ]; then
    export MESOS_AUTHENTICATE=true
    export MESOS_AUTHENTICATE_SLAVES=true
    touch /tmp/credentials
    chmod 600 /tmp/credentials
    printf '%s %s' "$PRINCIPAL" "$SECRET" > /tmp/credentials
    export MESOS_CREDENTIALS=/tmp/credentials
fi

# use EC2 IPv4 Address
if [ -n "$EC2_INSTANCE" ]; then
    export MESOS_ADVERTISE_IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
fi

# start service
exec "$@"