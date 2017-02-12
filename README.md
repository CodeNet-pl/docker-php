Easy to customize docker PHP images
===

Purpose of this set of PHP images is to simplify installation of required extensions. All you need to do is to provide a list of required extensions.
All images are based directly on official PHP images from version 5.6.26 to 7.1.1. Currently only PHP alpine images are supported.
To use it just prefix the official image with `codenet/` like in examples below:

Example 5.6 images:

* `codenet/php:5.6.26-fpm-alpine`
* `codenet/php:5.6-alpine`
* `codenet/php:5-zts-alpine`

Example 7.0 images:

* `codenet/php:7.0.15-alpine`
* `codenet/php:7.0-alpine`
* `codenet/php:7-zts-alpine`

Example 7.1 images:

* `codenet/php:7.1.1-zts-alpine`
* `codenet/php:7.1-fpm-alpine`
* `codenet/php:7-alpine`

Docker Hub repository can be found here: https://hub.docker.com/r/codenet/php/

Available PHP modules (to install)
---

* gd
* mysqli
* pdo_mysql
* mongo (PHP 5.6)
* mongodb (PHP 7.x)
* apc
* apcu
* xdebug
* imagick

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
