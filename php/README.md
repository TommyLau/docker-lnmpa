# lnmpa-php

lnmpa-php is a PHP-FPM Server boxed in a Docker image built by [Tommy Lau](http://tommy.net.cn/).

## What is in this image?

This image is a php web development environment cooked based on the offical docker image `php:fpm`, and with the following enhancements.

Fixed:

- Fixed docker-php-ext-install script error while checking ext-module.ini

Enabled:

- Enabled GD support with GIF, JPEG, PNG, WBMP, XBM and FreeType(TrueType Fonts)
- Enabled LDAP support
- Enabled mbstring
- Enabled mcrypt
- Enabled mysql
- Enabled mysqli
- Enabled pdo_mysql
- Enabled zip

Framework support:

- [CodeIgniter](https://ellislab.com/codeigniter)
- [Laravel](http://laravel.com/)

Other:

- Switch system and php timezone to **Asia/Shanghai**, which is CST(China Standard Time)

TODO:

- Add boot2docker permissions fix

## How to use this image

### Single instance mode

Get the docker image by running the following commands:

```bash
docker pull tommylau/php
```

Start an instance:

```bash
docker run --name php -v /path/to/web:/var/www/html -d tommylau/php
```

This will start an instance, and you are ready to go.

### Linking with other containers

To use this image linking with MySQL, you have to have a running MySQL instance, more information about MySQL docker image, please refer to [tommylau/mysql](https://registry.hub.docker.com/u/tommylau/mysql/). Suppose you have a MySQL instance named **mysql5.6_server**, we can link it in our php instance with the name **mysql** like this:

```bash
docker run --name php -v /path/to/web:/var/www/html --link mysql5.6_server:mysql -d tommylau/php
```

Then in the instance, you can use the hostname `mysql` to connect to the database.
