#!/bin/bash

build() {
  MESOS_VERSION=$1
  MESOSPHERE_TAG=$2

  TAG=${MESOS_VERSION}-${MESOSPHERE_TAG}

  ROLE=${3:-agent}

# build
  echo Building pixelmilk/mesos-${ROLE}
    docker build \
      --compress \
      -t pixelmilk/mesos-${ROLE}:${TAG} \
      . || exit $?
}

# curl http://169.254.169.254/latest/meta-data/local-ipv4

#     Mesos version   Mesosphere tag
build "1.3.0"	  	    "2.0.3"