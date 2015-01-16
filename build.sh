#!/bin/sh
# Build MySQL from mysql
docker build -t tommylau/lnmpa:nginx nginx

# Build MySQL from mysql
docker build -t tommylau/lnmpa:mysql mysql

# Build PHP-FPM from php
docker build -t tommylau/lnmpa:php php

# Build Apache from php:apache
docker build -t tommylau/lnmpa:apache apache

# Build Xdebug from tommylau/lnmpa:apache
docker build -t tommylau/lnmpa:xdebug xdebug

