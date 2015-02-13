# lnmpa-xdebug

lnmpa-xdebug is an Apache Server with Xdebug enabled and boxed in a Docker image built by [Tommy Lau](http://tommy.net.cn/).

## What is in this image?

This image is a php web development environment cooked based on the offical docker image `php:apache` and my personal image `tommylau/apache`. This image's features are exactly the same as [tommylau/apache](https://registry.hub.docker.com/u/tommylau/apache/), and with [Xdebug](http://xdebug.org/) added for remote PHP debugging.

**WARNING:** This image is used for local php development only, running this image in production or intranet while debugging might blocking other users from visiting the websites.

## How to use this image

Get the docker image by running the following commands:

```bash
docker pull tommylau/xdebug
```

Start an instance:

```bash
docker run --name xdebug -v /path/to/web:/var/www/html -p 80:80 -d tommylau/xdebug
```

This will start an instance, and you are ready to go.

If you are running [boot2docker](https://github.com/boot2docker/boot2docker) under MacOS or Windows, it is a good idea to add `BOOT2DOCKER=1` as an environment variable. In this way, Apache2 will run under user `docker` (uid 1000) and group `staff` (gid 50), so that PHP won't complain about the permission denied when you try to write something to the disk through PHP, like say, upload an image to server.

```bash
docker run --name xdebug -v /path/to/web:/var/www/html -p 80:80 -e BOOT2DOCKER=1 -d tommylau/xdebug
```
