#! /bin/bash

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
make docker-build VERSION=$TRAVIS_TAG
make docker-push VERSION=$TRAVIS_TAG