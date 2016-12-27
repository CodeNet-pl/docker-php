#!/bin/sh

major="5"
minor="5.6"
patch="5.6.26 5.6.27 5.6.28"

for ma in $major; do
    for mi in $minor; do
        for pa in $patch; do
            sh build.sh $pa-alpine
            sh build.sh $pa-fpm-alpine
            sh build.sh $pa-zts-alpine
        done
        sh build.sh $mi-alpine
        sh build.sh $mi-fpm-alpine
        sh build.sh $mi-zts-alpine
    done
    sh build.sh $ma-alpine
    sh build.sh $ma-fpm-alpine
    sh build.sh $ma-zts-alpine
done

exit 0

