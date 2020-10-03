#!/usr/bin/env bash
VERSION=$(jq '.dependencies["unleash-server"]' package.json --raw-output)
echo "building: $VERSION"
docker build . -t tengable/unleash:$VERSION
docker tag tengable/unleash:$VERSION tengable/unleash:latest
docker push tengable/unleash:$VERSION
docker push tengable/unleash:latest
