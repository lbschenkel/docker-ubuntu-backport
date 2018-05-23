#!/bin/sh
set -e

IMAGE=backport
CONTAINER=${IMAGE}_tmp

init() {
  set -x
  docker build -t $IMAGE .
  docker rm -f $CONTAINER
  docker run --name $CONTAINER --privileged $IMAGE \
    pbuilder create --components 'main restricted universe multiverse'
  docker commit --change='CMD bash' $CONTAINER $IMAGE
}

run() {
  set -x
  docker run -it --privileged -v $(pwd)/deb:/deb $IMAGE $@
}

CMD=$1
case "$CMD" in
  init)
    init
    ;;
  backport)
    shift
    run backport.sh $@
    ;;
  run)
    shift
    run $@
    ;;
  *)
    echo "usage: $0 [ init | backport <pkg> ]"
    ;;
esac
