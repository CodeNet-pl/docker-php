Easy to customize docker PHP images
===

Purpose of this set of PHP images is to simplify installation of required extensions. All you need to do is to provide a list of required extensions.
All images are based directly on official PHP images. Currently only PHP alpine images listed below are supported.

* `codenet/php:fpm-alpine:5.6.26`
* `codenet/php:fpm-alpine:5.6`
* `codenet/php:fpm-alpine:5`
* `codenet/php:alpine:5.6.26`
* `codenet/php:alpine:5.6`
* `codenet/php:alpine:5`
* `codenet/php:zts-alpine:5.6.26`
* `codenet/php:zts-alpine:5.6`
* `codenet/php:zts-alpine:5`

Docker Hub repository can be found here: https://hub.docker.com/r/codenet/php/

Available PHP modules (to install)
---

* gd
* mysqli
* pdo_mysql
* mongo
* apcu

Pre-installed modules
---

PHP Modules:
Core, ctype, curl, date, dom, ereg, fileinfo, filter, ftp, hash, iconv, json, libxml, mbstring, mysqlnd, openssl, pcre, PDO, pdo_sqlite, Phar, posix, readline, Reflection, session, SimpleXML, SPL, sqlite3, standard, tokenizer, xml, xmlreader, xmlwriter, zlib

Zend Modules:
none

Usage
---

Create your Dockerfile
```
FROM codenet/php:5.6-fpm-alpine

RUN install-php-extension mongo gd apcu
```
And that is it, you dont need to install any system packages, this will be done automatically for you.
