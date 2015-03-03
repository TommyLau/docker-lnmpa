# lnmpa-php-5.2

lnmpa-php-5.2 is a PHP-FPM Server boxed in a Docker image built by [Tommy Lau](http://tommy.net.cn/).

## What is in this image?

This image is a php web development environment cooked from scratch with PHP version 5.2.17. Though PHP 5.2 is obsoleted, but a lot of PHP applications are still PHP 5.2 only, such like [ECShop](http://www.ecshop.com/) and etc. So I cooked this image with the following features.

Fixed:

- Fixed docker-php-ext-install script error while checking ext-module.ini

Enabled:

- Enabled GD support with GIF, JPEG, PNG, WBMP and XBM
- Enabled mbstring
- Enabled mcrypt
- Enabled mysql
- Enabled mysqli
- Enabled pdo_mysql
- Enabled soap

Other:

- Set php timezone to **Etc/UTC**

TODO:

- Add boot2docker permissions fix

## How to use this image

### Single instance mode

Get the docker image by running the following commands:

```bash
docker pull tommylau/php-5.2
```

Start an instance:

```bash
docker run --name php -v /path/to/web:/var/www/html -d tommylau/php-5.2
```

This will start an instance, and you are ready to go.

### Linking with other containers

To use this image linking with MySQL, you have to have a running MySQL instance, more information about MySQL docker image, please refer to [tommylau/mysql](https://registry.hub.docker.com/u/tommylau/mysql/). Suppose you have a MySQL instance named **mysql5.6_server**, we can link it in our php instance with the name **mysql** like this:

```bash
docker run --name php -v /path/to/web:/var/www/html --link mysql5.6_server:mysql -d tommylau/php-5.2
```

Then in the instance, you can use the hostname `mysql` to connect to the database.
