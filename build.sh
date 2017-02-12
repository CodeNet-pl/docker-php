#!/bin/sh

test=

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

INSTALLER=$(cat packages/$1-alpine.template)
export DOCKER_PHP_VERSION=$2
export INSTALLER;

envsubst '$DOCKER_PHP_VERSION' < templates/Dockerfile.template > build/Dockerfile
envsubst '$INSTALLER' < templates/install-php-extension.template > build/install-php-extension

echo "Building image codenet/php:${DOCKER_PHP_VERSION}..."
docker build --pull --no-cache -t codenet/php:${DOCKER_PHP_VERSION} build > /dev/null || exit 1;

# Run basic test (install all available packages one by one)
all_extensions="xdebug apcu imagick gd mysqli pdo_mysql"

if [ ! -z $test ]; then
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
fi

# Push if test has passed
echo "Pushing image codenet/php:${DOCKER_PHP_VERSION}..."
docker push codenet/php:$DOCKER_PHP_VERSION > /dev/null || exit 1

cleanup