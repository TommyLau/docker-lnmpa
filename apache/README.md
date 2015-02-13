# lnmpa-apache

lnmpa-apache is an Apache Server boxed in a Docker image built by [Tommy Lau](http://tommy.net.cn/).

## What is in this image?

This image is a php web development environment cooked based on the offical docker image `php:apache`, and with the following enhancements.

**WARNING:** The `php.ini` is set to development, it is highly recommended **NOT** to run this image for production enivornments.

Fixed:

- Fixed docker-php-ext-install script error while checking ext-module.ini

Enabled:

- Enabled Apache2 rewrite module
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
- Support boot2docker permissions fix with `-v` argument

## How to use this image

### Single instance mode

Get the docker image by running the following commands:

```bash
docker pull tommylau/apache
```

Start an instance:

```bash
docker run --name apache -v /path/to/web:/var/www/html -p 80:80 -d tommylau/apache
```

This will start an instance, and you are ready to go.

### Boot2Docker under Mac OS or Windows

If you are running [boot2docker](https://github.com/boot2docker/boot2docker) under MacOS or Windows, it is a good idea to add `BOOT2DOCKER=1` as an environment variable. In this way, Apache2 will run under user `docker` (uid 1000) and group `staff` (gid 50), so that PHP won't complain about the permission denied when you try to write something to the disk through PHP, like say, upload an image to server.

```bash
docker run --name apache -v /path/to/web:/var/www/html -p 80:80 -e BOOT2DOCKER=1 -d tommylau/apache
```

### Linking with other containers

To use this image linking with MySQL, you have to have a running MySQL instance, more information about MySQL docker image, please refer to [tommylau/mysql](https://registry.hub.docker.com/u/tommylau/mysql/). Suppose you have a MySQL instance named **mysql5.6_server**, we can link it in our Apache2 instance with the name **mysql** like this:

```bash
docker run --name apache -v /path/to/web:/var/www/html --link mysql5.6_server:mysql -p 80:80 -e -d tommylau/apache
```

Then in the instance, you can use the hostname `mysql` to connect to the database.
