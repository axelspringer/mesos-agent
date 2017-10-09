#!/bin/bash

push() {
  MESOS_VERSION=$1

  TAG=${MESOS_VERSION}

  ROLE=${3:-agent}

# base
  echo
  echo Pushing axelspringer/mesos-${ROLE}:${TAG}
  docker push axelspringer/mesos-${ROLE}:${TAG} || exit $?
}

# login docker before push
docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"

#    Mesos version
push "1.4.0"
