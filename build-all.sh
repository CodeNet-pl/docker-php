#!/bin/sh

sh build.sh 5.6.26-fpm-alpine && \
sh build.sh 5.6-fpm-alpine && \
sh build.sh 5-fpm-alpine && \

sh build.sh 5.6.26-alpine && \
sh build.sh 5.6-alpine && \
sh build.sh 5-alpine && \

sh build.sh 5.6.26-zts-alpine && \
sh build.sh 5.6-zts-alpine && \
sh build.sh 5-zts-alpine && \

exit 0

