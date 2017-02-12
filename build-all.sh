#!/bin/bash

build_versions () {
    major=$1
    minor=$2
    shift
    shift
    patches=$@

    for patch in $patches; do
        build_batch $major.$minor $major.$minor.$patch || exit 1
    done

    build_batch $major.$minor $major.$minor || exit 1
    build_batch $major.$minor $major
}

build_batch () {
    template=$1
    version=$2

    sh build.sh $template $version-alpine || exit 1
    sh build.sh $template $version-fpm-alpine || exit 1
    sh build.sh $template $version-zts-alpine || exit 1
}

#build_versions 5 6 {26..30}
#build_versions 7 0 {14..15}
build_versions 7 1 {0..1}

exit 0

