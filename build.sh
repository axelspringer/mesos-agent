#!/bin/bash

build() {
  MESOS_VERSION=$1

  TAG=${MESOS_VERSION}

  ROLE=${3:-agent}

# build
  echo Building axelspringer/mesos-${ROLE}
    docker build \
      --compress \
      -t axelspringer/mesos-${ROLE}:${TAG} \
      . || exit $?
}

#     Mesos version
build "1.4.0"