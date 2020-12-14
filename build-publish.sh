#!/usr/bin/env bash
VERSION=$(jq '.dependencies["unleash-server"]' package.json --raw-output)
# IMAGE_NAME="us.gcr.io/tengable-api/unleash"
IMAGE_NAME="tengable/unleash"
echo "building: $VERSION"
docker build . -t $IMAGE_NAME:$VERSION
docker tag $IMAGE_NAME:$VERSION $IMAGE_NAME:latest
docker push $IMAGE_NAME:$VERSION
docker push $IMAGE_NAME:latest
