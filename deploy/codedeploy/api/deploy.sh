#!/usr/bin/env bash
cd /home/ubuntu/api

### For JDK
source "/home/ubuntu/.sdkman/bin/sdkman-init.sh"

# echo "Incrementing build version"
# ==============================
mayor=`cut -d '.' -f1 version`
minor=`cut -d '.' -f2 version`
build=`cut -d '.' -f3 version`
VERSION="$mayor.$minor.$build"

IMAGE_REPO=microsip
IMAGE_TAG=ms-demo
IMAGE="$IMAGE_REPO/$IMAGE_TAG:$VERSION"

echo "Building image '$IMAGE'"
# =====================================
docker build -t "$IMAGE" .

if [[ $? -ne 0 ]] ; then
    echo "Error creating image $IMAGE"
    exit 1
fi

PORT="8080"

CONTAINER="microsip-ms-demo-$PORT"
echo "Deploying $CONTAINER"
CONTAINER_EXISTS=$(docker ps -a | grep $CONTAINER)

docker stop $CONTAINER
docker rm -f $CONTAINER

docker run -d -p "$PORT:8080" \
  --name $CONTAINER \
  --restart always \
  "$IMAGE"

echo "Registering $CONTAINER in Load Balancer..."
