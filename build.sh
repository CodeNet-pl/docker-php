#!/bin/sh

err() {
    echo $1 1>&2
    exit 1
}
cleanup() {
    rm -f build/*
    unset INSTALLER
    unset DOCKER_PHP_VERSION
}

cleanup

INSTALLER=$(cat packages/alpine.template)
export DOCKER_PHP_VERSION=$1
export INSTALLER;

envsubst '$DOCKER_PHP_VERSION' < templates/Dockerfile.template > build/Dockerfile
envsubst '$INSTALLER' < templates/install-php-extension.template > build/install-php-extension
docker pull php:${DOCKER_PHP_VERSION} || exit 1;
docker build --no-cache -t codenet/php:${DOCKER_PHP_VERSION} build || exit 1;

# Run basic test (install all available packages)
all_extensions="imagick gd mysqli pdo_mysql mongo"

# test all extensions separately
for ext in $all_extensions; do
    export EXTENSIONS=$ext
    envsubst '$DOCKER_PHP_VERSION $EXTENSIONS' < templates/Dockerfile.test > build/Dockerfile
    docker build --no-cache -t codenet/tmp -f build/Dockerfile . || exit 1
done

# test all extensions at once
export EXTENSIONS=$all_extensions
envsubst '$DOCKER_PHP_VERSION $EXTENSIONS' < templates/Dockerfile.test > build/Dockerfile
docker build --no-cache -t codenet/tmp -f build/Dockerfile . || exit 1

# Push if test has passed
docker push codenet/php:$DOCKER_PHP_VERSION

cleanup