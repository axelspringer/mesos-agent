#!/bin/bash

push() {
  MESOS_VERSION=$1
  MESOSPHERE_TAG=$2

  TAG=${MESOS_VERSION}-${MESOSPHERE_TAG}

  ROLE=${3:-agent}

# base
  echo
  echo Pushing pixelmilk/mesos-${ROLE}:${TAG}
  docker push pixelmilk/mesos-${ROLE}:${TAG} || exit $?
}

# login docker before push
docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"

#    Mesos version     Mesosphere tag
push "1.3.0"	  	   "2.0.3"
