#!/bin/bash

build() {
  MESOS_VERSION=$1

  TAG=${MESOS_VERSION}

  ROLE=${3:-agent}

# build
  echo Building pixelmilk/mesos-${ROLE}
    docker build \
      --compress \
      -t pixelmilk/mesos-${ROLE}:${TAG} \
      . || exit $?
}

#     Mesos version
build "1.3.1"